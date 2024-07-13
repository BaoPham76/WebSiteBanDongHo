<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Support\Facades\Auth;

class EmailVerificationPromptController extends Controller
{
    /**
     * Display the email verification prompt.
     *
     * @return mixed
     */
    public function __invoke()
    {
        $user = Auth::user();

        // Kiểm tra xem người dùng  đã xác minh email chưa
        if ($user->hasVerifiedEmail()) {
            return redirect()->intended(RouteServiceProvider::ADMIN);
        } else {
            return view('admin.auth.verify-email');
        }
    }
}
