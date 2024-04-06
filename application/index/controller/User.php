<?php
namespace app\index\controller;

use think\Controller;

class User extends Base
{
    public function __initialize()
    {
        parent::__initialize();
    }

    public function index()
    {
        return $this->view->fetch();
    }

}
