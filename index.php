<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
// 定义项目路径
define('APP_PATH', __DIR__ . '/application/');
//\think\Url::root('/');

//定义PUBLIC目录
define('SITE_URL','/');
define('CSS_URL',SITE_URL.'public/css');
define('IMG_URL',SITE_URL.'public/img');
define('JS_URL',SITE_URL.'public/js');


//定义当前控制器URL
define('DQURL',"http://".$_SERVER['HTTP_HOST']);
define('SITEURL',"http://".$_SERVER['HTTP_HOST']."");

//全局变量
define('TITLE','无锡力支');

// 加载框架引导文件
require './thinkphp/start.php';
