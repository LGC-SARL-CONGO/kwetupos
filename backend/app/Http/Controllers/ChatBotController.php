<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ChatConversation;
use App\Services\ChatBotService;
use Illuminate\Support\Str;
use Carbon\Carbon;

class ChatBotController extends Controller
{
    protected $chatBotService;

    public function __construct(ChatBotService $chatBotService)
    {
        $this->chatBotService = $chatBotService;
    }

    public function store(Request $request)
    {
        // Validation des données reçues
        $validatedData = $request->validate([
            'user_message' => 'required|string',
        ]);

        // Vérifier si l'utilisateur est authentifié
        $userId = auth()->check() ? auth()->id() : $this->getTemporaryUserId();

        // Générer une réponse du bot
        $botResponse = $this->chatBotService->getResponse($validatedData['user_message']);

        // Vérifier la dernière interaction
        $lastInteraction = ChatConversation::where('user_id', $userId)
            ->latest('last_interaction_at')
            ->first();

        $isFirstMessageOfTheDay = true;

        if ($lastInteraction) {
            $lastInteractionDate = $lastInteraction->last_interaction_at;
            if (is_string($lastInteractionDate)) {
                $lastInteractionDate = Carbon::parse($lastInteractionDate);
            }
            $lastDate = $lastInteractionDate->format('Y-m-d');
            $today = now()->format('Y-m-d');
            $isFirstMessageOfTheDay = ($lastDate !== $today);
        }

        // Création de la conversation et enregistrement dans la base de données
        try {
            $conversation = new ChatConversation();
            $conversation->user_id = $userId;
            $conversation->user_message = $validatedData['user_message'];
            $conversation->bot_response = $botResponse;
            $conversation->last_interaction_at = now(); // Stocke l'heure actuelle
            $conversation->save();

            return response()->json([
                'user_message' => $validatedData['user_message'],
                'bot_response' => $conversation->bot_response
            ]);
        } catch (\Exception $e) {
            // Log l'exception pour débogage
            \Log::error('Erreur lors de la sauvegarde de la conversation: ' . $e->getMessage());
            return response()->json(['message' => 'Erreur lors de la sauvegarde de la conversation'], 500);
        }
    }

    public function index()
    {
        // Récupérer toutes les conversations (ou filtrer par utilisateur)
        $userId = auth()->check() ? auth()->id() : $this->getTemporaryUserId();
        $conversations = ChatConversation::where('user_id', $userId)->get();

        // Retourner les conversations au format JSON
        return response()->json($conversations);
    }

    protected function getTemporaryUserId()
    {
        // Vous pouvez stocker cet ID temporaire dans la session ou utiliser un UUID
        // Ici, on utilise un UUID pour éviter les collisions
        $temporaryId = session()->get('temporary_user_id', Str::uuid()->toString());
        session()->put('temporary_user_id', $temporaryId);

        return $temporaryId;
    }

    public function checkLastInteraction()
    {
        try {
            $userId = auth()->check() ? auth()->id() : $this->getTemporaryUserId();
            $lastInteraction = ChatConversation::where('user_id', $userId)
                ->latest('last_interaction_at')
                ->first();

            $lastInteractionDate = $lastInteraction ? $lastInteraction->last_interaction_at->format('Y-m-d') : null;
            $today = now()->format('Y-m-d');

            return response()->json([
                'isFirstMessageOfTheDay' => $lastInteractionDate !== $today
            ]);
        } catch (\Exception $e) {
            \Log::error('Erreur lors de la vérification de la dernière interaction: ' . $e->getMessage());
            return response()->json(['message' => 'Erreur lors de la vérification de la dernière interaction'], 500);
        }
    }

    public function handleCall()
    {
        // Logique pour initier un appel via PBX (par exemple Asterisk, Twilio, etc.)
        $response = $this->chatBotService->initiateCall();

        return response()->json([
            'bot_response' => 'Appel initié. Nous vous contacterons sous peu.',
        ]);
    }
}
