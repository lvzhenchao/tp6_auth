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
        //后台登录拦截
        //判断是否有session
        //判断是否是登录页面，防止多次重定向

        //$response = $next($request);//后置中间件有问题

        //if (empty(session('adminAccount')) && $request->controller() != "Login") {//后置使用
        //echo "<br>后置中间件<br>";

        if (empty(session('adminAccount')) && !preg_match("/login/", $request->pathinfo())) {

            return redirect((string)url('login/index'));
        }
        
        return $next($request);
    }
}
