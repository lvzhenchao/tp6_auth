<?php
declare (strict_types = 1);

namespace app\admin\middleware;

class Check
{
    /**
     * 处理请求
     *
     * @param \think\Request $request
     * @param \Closure       $next
     * @return Response
     */
    public function handle($request, \Closure $next)
    {
//        echo "后台中间件<br>";
        //后台登录拦截
        //判断是否有session
        //判断是否是登录页面，防止多次重定向
        $response = $next($request);
        if (empty(session('adminAccount')) && $request->controller() != "Login") {
            return redirect((string)url('Login/index'));
        }
        
        return $next($request);
    }
}
