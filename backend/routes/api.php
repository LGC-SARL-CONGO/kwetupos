<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\ChatBotController;
use App\Http\Controllers\Api\ManageUserApiController;
use App\Http\Controllers\Api\ManageUserController; // Assurez-vous que c'est bien importé
use App\Http\Controllers\Api\RoleApiController; // Ajoutez cette ligne pour inclure le nouveau contrôleur

/*
|---------------------------------------------------------------------------|
| API Routes                                                                |
|---------------------------------------------------------------------------|
| Here is where you can register API routes for your application. These     |
| routes are loaded by the RouteServiceProvider within a group which       |
| is assigned the "api" middleware group. Enjoy building your API!        |
*/

// Route pour gérer les pré-requêtes OPTIONS (nécessaire pour CORS)
Route::options('/{any}', function () {
    return response()->json([], 200);
})->where('any', '.*');

// Route pour obtenir les informations de l'utilisateur authentifié
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Route pour la connexion
Route::post('/auth/login', [LoginController::class, 'login'])->name('login');

// Route pour la déconnexion
Route::middleware(['auth:api'])->post('/logout', [LoginController::class, 'logout'])->name('api.logout');

// Route pour stocker les données du chatbot
Route::middleware('auth:api')->post('/chat/store', [ChatBotController::class, 'store'])->name('chat.store');

// Route pour obtenir tous les utilisateurs
Route::middleware('auth:api')->get('/users', [ManageUserApiController::class, 'index'])->name('users.index');

// Route pour créer un nouvel utilisateur
Route::middleware('auth:api')->post('/users/create', [ManageUserApiController::class, 'apiStore'])->name('users.create');

// Routes pour gérer les rôles
Route::middleware('auth:api')->prefix('roles')->group(function () {
    Route::get('/', [RoleApiController::class, 'index'])->name('roles.index');
});
