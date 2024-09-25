<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use App\Utils\BusinessUtil;
use App\Utils\ModuleUtil;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;

class LoginController extends Controller
{
    use AuthenticatesUsers;

    protected $redirectTo = RouteServiceProvider::HOME;

    protected $businessUtil;
    protected $moduleUtil;

    public function __construct(BusinessUtil $businessUtil, ModuleUtil $moduleUtil)
    {
        $this->middleware('guest')->except('logout');
        $this->businessUtil = $businessUtil;
        $this->moduleUtil = $moduleUtil;
    }

    /**
     * Show the login form.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\View\View|\Illuminate\Http\JsonResponse
     */
    public function showLoginForm(Request $request)
    {
        if ($request->wantsJson()) {
            return response()->json(['message' => 'Please provide login credentials.'], 200);
        }

        return view('auth.login');
    }
    /**
     * Authenticate the user.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function login(Request $request)
    {
        $credentials = $request->only('username', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            // Log user activity
            if (method_exists($this->businessUtil, 'activityLog')) {
                $this->businessUtil->activityLog($user, 'login', null, [], false, $user->business_id);
            }

            // Check if business is active
            if (!$user->business->is_active) {
                Auth::logout();
                return $this->handleResponse($request, ['success' => 0, 'message' => __('lang_v1.business_inactive')], 403);
            }

            if ($user->status != 'active') {
                Auth::logout();
                return $this->handleResponse($request, ['success' => 0, 'message' => __('lang_v1.user_inactive')], 403);
            }

            if (!$user->allow_login) {
                Auth::logout();
                return $this->handleResponse($request, ['success' => 0, 'message' => __('lang_v1.login_not_allowed')], 403);
            }

            if (($user->user_type == 'user_customer') && !$this->moduleUtil->hasThePermissionInSubscription($user->business_id, 'crm_module')) {
                Auth::logout();
                return $this->handleResponse($request, ['success' => 0, 'message' => __('lang_v1.business_dont_have_crm_subscription')], 403);
            }

            if ($request->wantsJson()) {
                // Generate and return an API token
                $token = $user->createToken('KwetuPOS')->accessToken;
                return response()->json(['success' => 1, 'token' => $token, 'user' => $user,'redirect_to' => $this->redirectTo()], 200);
            }

            return redirect()->intended($this->redirectTo());
        }

        throw ValidationException::withMessages([
            'username' => [__('auth.failed')],
        ]);
    }

    /**
     * Log the user out of the application.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    public function logout(Request $request)
    {
        $user = Auth::user();

        if ($user) {
            // Log user activity
            if (method_exists($this->businessUtil, 'activityLog')) {
                $this->businessUtil->activityLog($user, 'logout');
            }

            // Revoke API tokens
            if ($request->wantsJson()) {
                $user->tokens->each(function ($token) {
                    $token->delete();
                });
            }

            Auth::logout();
        }

        if ($request->wantsJson()) {
            return response()->json(['success' => 1, 'message' => __('auth.logout')], 200);
        }

        return redirect('/login');
    }

    /**
     * Handle the response based on the request type.
     *
     * @param \Illuminate\Http\Request $request
     * @param array $response
     * @param int $status
     * @return \Illuminate\Http\JsonResponse|\Illuminate\Http\RedirectResponse
     */
    protected function handleResponse(Request $request, array $response, int $status = 200)
    {
        if ($request->wantsJson()) {
            return response()->json($response, $status);
        }

        return redirect()->back()->withErrors($response);
    }

    /**
     * Redirect users based on their role.
     *
     * @return string
     */
    protected function redirectTo()
    {
        $user = Auth::user();

        if (!$user->can('dashboard.data') && $user->can('sell.create')) {
            return '/pos/create';
        }

        if ($user->user_type == 'user_customer') {
            return 'contact/contact-dashboard';
        }

        return '/home';
    }
}
