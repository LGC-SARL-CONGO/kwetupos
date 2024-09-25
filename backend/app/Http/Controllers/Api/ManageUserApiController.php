<?php

namespace App\Http\Controllers\Api;

use App\User;
use App\Utils\ModuleUtil;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class ManageUserApiController extends Controller
{
    protected $moduleUtil;

    public function __construct(ModuleUtil $moduleUtil)
    {
        $this->moduleUtil = $moduleUtil;

        // Assurez-vous que ce contrôleur utilise le middleware d'authentification
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of users with their roles.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        // Récupération de l'ID de l'entreprise à partir du token
        $business_id = $request->user()->business_id;

        if (!$business_id) {
            return response()->json(['error' => 'Business ID is missing'], 400);
        }

        try {
            $users = User::where('business_id', $business_id)
                        ->where('is_cmmsn_agnt', 0)
                        ->with('roles') // Inclure les rôles des utilisateurs
                        ->select([
                            'id',
                            'username',
                            DB::raw("TRIM(CONCAT(COALESCE(surname, ''), ' ', COALESCE(first_name, ''), ' ', COALESCE(last_name, ''))) as full_name"),
                            'email',
                            'allow_login',
                        ])
                        ->get();

            // Optionnel : formatage des données pour les rendre plus lisibles
            $formattedUsers = $users->map(function ($user) {
                return [
                    'id' => $user->id,
                    'full_name' => $user->full_name,
                    'username' => $user->username,
                    'email' => $user->email,
                    'allow_login' => $user->allow_login,
                    'roles' => $user->roles->pluck('name')
                ];
            });

            return response()->json([
                'status' => 'success',
                'data' => $formattedUsers
            ]);
        } catch (\Exception $e) {
            Log::error($e->getMessage());
            return response()->json(['error' => 'An error occurred'], 500);
        }
    }
    
    
    
}
