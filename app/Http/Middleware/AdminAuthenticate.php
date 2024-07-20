<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

class AdminAuthenticate
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        $currentRoute = Route::currentRouteName();
        //Biến $isVerify kiểm tra xem route hiện tại có phải là admin.user.verify hoặc admin.verify.success không. Nếu đúng thì $isVerify sẽ là true.
        $isVerify = $currentRoute == 'admin.user.verify' ||
            $currentRoute == 'admin.verify.success';
        //Check admin đăng nhập chưa 
        if (Auth::guard('admin')->check() || $isVerify) {
            //next sang route tiếp theo, cho phép request chạy qua
            return $next($request);
        }

        return redirect()->route('admin.login');
    }
}
