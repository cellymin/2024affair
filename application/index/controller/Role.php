<?php
namespace app\index\controller;

use think\Controller;

class Role extends Base
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
