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
        
        return $next($request);
    }
}
