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
}
