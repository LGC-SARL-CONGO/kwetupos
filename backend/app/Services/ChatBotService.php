<?php

namespace App\Services;

class ChatBotService
{
    public function getResponse($userMessage)
    {
        $responses = [
            // 'bonjour' => 'Bonjour! Comment puis-je vous aider aujourd\'hui?',
            'bonjour' => 'Bonjour ! KwetuBot est en cours de maintenance. Vous pouvez contacter le support technique à l\'adresse suivante : kwetupos@gmail.com.',
            'aide' => 'Vous pouvez me demander des informations sur nos services ou produits.',
            'contact' => 'Pour nous contacter, veuillez envoyer un email à support@example.com',
        ];

        $lowercasedMessage = strtolower($userMessage);

        foreach ($responses as $keyword => $response) {
            if (strpos($lowercasedMessage, $keyword) !== false) {
                return $response;
            }
        }

        return 'Désolé, je n\'ai pas compris votre message.';
    }

    public function initiateCall()
    {
        // Logique d'appel PBX, par exemple via l'AMI d'Asterisk ou une API Twilio
        // Exemple:
        // $ami = new AsteriskAMI();
        // $ami->call($from, $to);

        // Retourner un message de succès ou une erreur en fonction du résultat de l'appel
        return "Appel initié";
    }
}
