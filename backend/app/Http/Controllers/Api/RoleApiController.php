<?php

namespace App\Http\Controllers\API;

use App\Utils\ModuleUtil;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Spatie\Permission\Models\Role;
use App\Http\Controllers\Controller;

class RoleApiController extends Controller
{
    /**
     * All Utils instance.
     */
    protected $moduleUtil;

    /**
     * Create a new controller instance.
     *
     * @param ModuleUtil $moduleUtil
     * @return void
     */
    public function __construct(ModuleUtil $moduleUtil)
    {
        $this->moduleUtil = $moduleUtil;

        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function index(Request $request)
    {
        $business_id = $request->user()->business_id;

        if (!$business_id) {
            return response()->json(['error' => 'Business ID is missing'], 400);
        }

        try {
            $roles = Role::where('business_id', $business_id)
                        ->select(['name', 'id', 'is_default', 'business_id'])
                        ->get(); // Ajout de get() pour récupérer les données
            
            return response()->json([
                'status' => 'success',
                'data' => $roles
            ]);
        } catch (\Exception $e) {
            // Log l'erreur pour le débogage
            Log::error($e->getMessage());
            return response()->json(['error' => 'An error occurred'], 500);
        }
    }
}
