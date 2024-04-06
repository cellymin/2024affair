<?php

namespace app\index\controller;

use think\Controller;
use think\Db;

class Xiaoshou extends Base
{
    public function __initialize()
    {
        parent::__initialize();
    }

    public function index()
    {
        $kehu = Db::table('af_kehu')
            ->where('status', 1)
            ->select();
        if (isset($_GET['id']) && !empty($_GET['id']) && intval($_GET['id']) > 0) {
            $xiaoshou_id = intval($_GET['id']);
            $xiaoshouinfo = Db::table('af_xiaoshoulocal')
                ->alias('xs')
                ->join('af_product p','xs.product_id=p.product_id')
                ->where('xs.status', 1)
                ->where('p.status', 1)
                ->where('xs.xiaoshou_id', $xiaoshou_id)
                ->find();
            $this->assign('xiaoshouinfo', $xiaoshouinfo);
//            echo '<pre/>';var_dump($xiaoshouinfo);die();
        }
        $xiaoshoulist = Db::table('af_xiaoshoulocal')
            ->field('xs.*,p.product_name')
            ->alias('xs')
            ->join('af_product p','xs.product_id=p.product_id')
            ->where('xs.status', 1)
            ->where('p.status', 1)
            ->select();
//echo '<pre/>';var_dump($xiaoshoulist);die();
        $this->assign('kehu', $kehu);
        $this->assign('xiaoshoulist', $xiaoshoulist);
        return $this->view->fetch();
    }

    public function save_xiaoshou()
    {
        $xiaoshoudata = trim($_POST['xiaoshoudata']);
        $chaniarr = explode(',', $xiaoshoudata);
        $xiaoshou_id = intval($_GET['xs_id']);

        foreach ($chaniarr as $k => $v) {
            $new[substr($v, 0, strrpos($v, '*'))] = substr($v, strripos($v, "*") + 1);
        }

        if (empty($new['company_name'])) {
            $data['msg'] = "公司名称不能为空";
            $data['code'] = 0;
            return json_encode($data);
        }

        if ($xiaoshou_id > 0) {
            unset($new['create_time']);
            $new['update_time'] = date('Y-m-d H:i:s');
            unset($new['product_name']);
            Db::startTrans();
            try {
                if(intval($new['deeliverydays'])>0){

                    switch (intval($new['deeliverydays'])){
                        case 1:
                            $new['deeliverydays'] = 1;break;//现货
                        case 2:
                            $new['deeliverydays'] = 7;break;//一周
                        case 3:
                            $new['deeliverydays'] = 14;break;//两周
                        case 4:
                            $new['deeliverydays'] = 30;break;//一个月
                        case 5:
                            $new['deeliverydays'] = 45;break;//45天
                        default:
                            $data['code'] = 0;
                            $data['msg'] = '请选择交货期';
                            return json_encode($data);
                    }
                }else{
                    unset($data);
                    $data['code'] = 0;
                    $data['msg'] = '请选择交货期';
                    return json_encode($data);
                }
                $re = Db::table('af_xiaoshoulocal')
                    ->where('xiaoshou_id', $xiaoshou_id)
                    ->update($new);
                if ($re) {
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                } else {
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                }


            } catch (\Exception $e) {
                Db::rollback();//回滚事务
                unset($data);
                $data['code'] = 0;
                $data['msg'] = '操作失败';
                return json_encode($data);
            }
        } else {
            Db::startTrans();
            try {
                //添加公司信息
                $kehudata['kehu_name'] = $new['company_name'];
                $kehudata['create_time'] = $new['create_time'];
                $re1 = Db::table('af_kehu')
                    ->insertGetId($kehudata);

                //添加产品信息
                $prodata['product_name'] = $new['product_name'];
                $prodata['create_time'] = $new['create_time'];
                $re2 = Db::table('af_product')
                    ->insertGetId($prodata);

                //添加销售基础单信息
                $xsdata['company_name'] = $new['company_name'];
                $xsdata['company_id'] = $re1;
                $xsdata['product_id'] = $re2;
                $xsdata['hanshui'] = $new['hanshui'];
                $xsdata['rate'] = $new['rate'];
                $xsdata['rate_money'] = $new['rate_money'];
                $xsdata['owe'] = $new['owe'];
                $xsdata['total_money'] = $new['total_money'];
                $xsdata['create_time'] = $new['create_time'];
                $xsdata['firpay_time'] = $new['firpay_time'];
                if(intval($new['deeliverydays'])>0){
                    switch (intval($new['deeliverydays'])){
                        case 1:
                            $xsdata['deeliverydays'] = 1;break;//现货
                        case 2:
                            $xsdata['deeliverydays'] = 7;break;//一周
                        case 3:
                            $xsdata['deeliverydays'] = 14;break;//两周
                        case 4:
                            $xsdata['deeliverydays'] = 30;break;//一个月
                        case 5:
                            $xsdata['deeliverydays'] = 45;break;//45天
                        default:
                            $xsdata['deeliverydays'] = '';
                            break;
                    }
                }else{
                    unset($data);
                    $data['code'] = 0;
                    $data['msg'] = '请选择交货期';
                    return json_encode($data);
                }
                $re3 = Db::table('af_xiaoshoulocal')
                    ->insertGetId($xsdata);

                //添加发票信息
                $invoicedata['kehu_id'] = $re1;
                $invoicedata['xs_id'] = $re3;
                $invoicedata['rate'] = $new['rate'];
                $invoicedata['rate_money'] = $new['rate_money'];
                $invoicedata['total_money'] = $new['total_money'];
                $invoicedata['create_time'] = $new['create_time'];
                $re4 = Db::table('af_invoice')
                    ->insertGetId($invoicedata);
                //添加日志信息
                $logdata['type'] = 1;
                $logdata['content'] = json_encode($xiaoshoudata);
                $logdata['create_time'] = date('Y-m-d H:i:s');
                $re5 = Db::table('af_xs_log')
                    ->insertGetId($logdata);

                if ($re1 && $re2 && $re3 && $re4 && $re5) {
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                } else {
                    Db::rollback();//提交事务
                    unset($data);
                    $data['code'] = 0;
                    $data['msg'] = '提交失败';
                    return json_encode($data);
                }
            } catch (\Exception $e) {
                Db::rollback();//回滚事务
                unset($data);
                $data['code'] = 0;
                $data['msg'] = '操作失败';
                return json_encode($data);
            }
        }
    }
    public function fahuo(){
        $xs_id = intval($_POST['xsid']);
        if(!$xs_id>0){
            unset($data);
            $data['code'] = 0;
            $data['msg'] = '操作不合法';
            return json_encode($data);
        }
        $picturestr = [];
        $picturestrs = '';
        $fahuo_time = trim($_POST['fahuo_time']);
        $fahuo_way = trim($_POST['fahuo_way']);
        $beizhu = trim($_POST['beizhu']);
        $xiaoshoudata = [];
        $uploaddir = $_SERVER['DOCUMENT_ROOT'] . "/upload/songhuodan";//文件存放目录
        if ($_FILES) {
            extract($_POST);
            $i = 0;
            foreach ($_FILES["upfile"]["error"] as $key => $error) {
                if ($error == UPLOAD_ERR_OK) {
                    $re = $this->upload_multi($uploaddir, $_FILES["upfile"], $i, $xs_id);
                    if (!empty($re)) {
                        $picturestr[] = $re;
                    }
                }
                $i++;
            }
        }
        foreach ($picturestr as $k => $v) {
            $picinfo = explode('_', $v);
            if (!file_exists($_SERVER['DOCUMENT_ROOT'] . "/upload/songhuodan/" . date('Ymd', $picinfo[2]) . '/' . $v)) {
                unset($picturestr[$k]);
            }
        }
        if (!empty($picturestr)) {
            $picturestrs = implode(',', $picturestr);
        }
        if(!empty($picturestrs)){
            $xiaoshoudata['fahuo_src'] = $picturestrs;
        }
        $xiaoshoudata['fahuo_time'] = $fahuo_time;
        $xiaoshoudata['fahuo_way'] = $fahuo_way;
        $xiaoshoudata['beizhu'] = $beizhu;
        $xiaoshoudata['product_status'] = 2;
        Db::startTrans();
        try {
        $re3 = Db::table('af_xiaoshoulocal')
            ->where('xiaoshou_id',$xs_id)
            ->update($xiaoshoudata);

        //添加日志信息
        $logdata['type'] = 6;
        $logdata['content'] = $fahuo_time.'发货';
        $logdata['create_time'] = date('Y-m-d H:i:s');
        $re5 = Db::table('af_xs_log')
            ->insertGetId($logdata);
            if ($re3 && $re5) {
                Db::commit();//提交事务
                unset($data);
                $data['code'] = 200;
                $data['msg'] = '发货提交成功';
                return json_encode($data);
            } else {
                Db::rollback();//提交事务
                unset($data);
                $data['code'] = 0;
                $data['msg'] = '提交失败';
                return json_encode($data);
            }
        } catch (\Exception $e) {
            Db::rollback();//回滚事务
            unset($data);
            $data['code'] = 0;
            $data['msg'] = '操作失败';
            return json_encode($data);
        }

    }

    public function upload_multi($path, $photo, $i, $xsid)
    {
        $date = date('Ymd', time());
        if (!file_exists($path))//如果目录不存在就新建
            $path = mkdir($path);

        if (!file_exists($path . '/' . $date))
            $childpath = mkdir($path . '/' . $date);
        $piece = explode('.', $photo['name'][$i]);
        $uploadfile = $path . '/' . $date . '/' . $xsid  . '_' . time() . '_' . $i . '.' . $piece[1];
        $result = move_uploaded_file($photo['tmp_name'][$i], $uploadfile);
        if (!$result) {
            exit('上传失败');
        }
        $this->image_zip($uploadfile, 50, 600);
        return basename($uploadfile);
    }
    function image_zip($url, $size_number, $size_thumb)
    {
        $size = filesize($url);
        $img = new \Think\Image();
        if (($size / 1000) > $size_number) {
            $image = $img->open($url);
            $image->thumb($size_thumb, $size_thumb)->save($url);
        }
    }
    public function fapiao(){
        $xs_id = intval($_GET['xs_id']);
        if(!$xs_id>0){
            unset($data);
            $data['code'] = 0;
            $data['msg'] = '操作不合法';
            return json_encode($data);
        }
        $create_time = trim($_POST['create_time']).' '.date('H:i:s');
        $invoice_no = trim($_POST['invoice_no']);
        $beizhu = trim($_POST['beizhu']);
        $xiaoshoudata = [];
        $invoicedata = [];
        $invoicedata['create_time'] =$create_time;
        $invoicedata['invoice_no'] =$invoice_no;
        $invoicedata['beizhu'] =$beizhu;
        $xiaoshoudata['invoice_status'] = 2;

        Db::startTrans();
        try {
            $re3 = Db::table('af_xiaoshoulocal')
                ->where('xiaoshou_id',$xs_id)
                ->update($xiaoshoudata);

            //添加发票
            $re4 = Db::table('af_invoice')
                ->where('xs_id',$xs_id)
                ->update($invoicedata);
            //添加日志信息
            $logdata['type'] = 5;
            $logdata['content'] = $create_time.'开票邮寄';
            $logdata['create_time'] = date('Y-m-d H:i:s');
            $re5 = Db::table('af_xs_log')
                ->insertGetId($logdata);
            if ($re3 && $re4 && $re5) {
                Db::commit();//提交事务
                unset($data);
                $data['code'] = 200;
                $data['msg'] = '发票提交成功';
                return json_encode($data);
            } else {
                Db::rollback();//提交事务
                unset($data);
                $data['code'] = 0;
                $data['msg'] = '提交失败';
                return json_encode($data);
            }
        } catch (\Exception $e) {
            Db::rollback();//回滚事务
            unset($data);
            $data['code'] = 0;
            $data['msg'] = '操作失败';
            return json_encode($data);
        }


    }
    public function delxiaoshou()
    {
        $id = intval($_GET['id']);
        $data['status'] = 2;
        $data['update_time'] = date('Y-m-d H:i:s');
        $re = Db::table('af_xiaoshoulocal')
            ->where('id', $id)
            ->update($data);
        if ($re) {
            unset($data);
            $data['code'] = 200;
            $data['msg'] = '删除成功';
            return json_encode($data);
        } else {
            unset($data);
            $data['code'] = 0;
            $data['msg'] = '操作失败';
            return json_encode($data);
        }
    }

}
