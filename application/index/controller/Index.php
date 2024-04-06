<?php
namespace app\index\controller;

use think\Controller;

class Index extends Base
{
    public function __initialize()
    {
        parent::__initialize();
    }

    public function index()
    {
        if (!empty($_SESSION['UID']) && intval($_SESSION['UID']) > 0) {

        }else{
//            return redirect('/index/login');
        }
        return $this->view->fetch();
    }
}
