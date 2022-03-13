<?php
declare (strict_types = 1);

namespace app\admin\controller;

class Index
{
    public function index()
    {
        return "后台页面";
        return view('',[
            'left_menu'=>1,
        ]);
    }

    /*退出*/
    public function logout() {

        // 清除session
        session(null);

        // 跳出
        return redirect('/');

    }
}
