<?php
namespace app\index\controller;

use think\Controller;
use think\Db;

class Chain extends Base
{
    public function __initialize()
    {
        parent::__initialize();
    }

    public function index()
    {
        $chain = Db::table('af_chain')
            ->where('status',1)
            ->select();
        if(isset($_GET['id']) && !empty($_GET['id']) && intval($_GET['id'])>0){
            $chain_id = intval($_GET['id']);
            $chaininfo = Db::table('af_chain')
                ->where('status',1)
                ->where('id',$chain_id)
                ->find();
            if(!empty($chaininfo)){
                $data['chain'] = $chaininfo;
                $data['code'] = 0;
                return json_encode($data);
            }else{
                $data['msg'] = "门店不存在";
                $data['code'] = 0;
                return json_encode($data);
            }
        }
        $this->assign('chain',$chain);
        return $this->view->fetch();
    }
    public function save_chain(){
        $chaindata = trim($_POST['chaindata']);
        $chaniarr = explode(',',$chaindata);
        $chain_id = intval($_GET['chain_id']);

        foreach ($chaniarr as $k=>$v) {
            $new[substr($v, 0, strrpos($v, '*'))] = substr($v, strripos($v, "*") + 1);
        }
        if (empty($new['name'])) {
            $data['msg'] = "门店名称不能为空";
            $data['code'] = 0;
            return json_encode($data);
        }
        $new['country'] = '中国';
        $new['create_time'] = date('Y-m-d H:i:s');

        if($chain_id>0){
            unset($new['create_time']);
            $new['update_time'] = date('Y-m-d H:i:s');
            Db::startTrans();
            try{
                $re = Db::table('af_chain')
                    ->where('id',$chain_id)
                    ->update($new);
                if($re){
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200 ;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                }else{
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200 ;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                }


            }catch(\Exception $e){
                Db::rollback();//回滚事务
                unset($data);
                $data['code'] = 0;
                $data['msg'] = '操作失败';
                return json_encode($data);
            }
        }else{
            Db::startTrans();
            try{
                $re = Db::table('af_chain')
                    ->insertGetId($new);
                if($re){
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200 ;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                }else{
                    Db::commit();//提交事务
                    unset($data);
                    $data['code'] = 200 ;
                    $data['msg'] = '提交成功';
                    return json_encode($data);
                }


            }catch(\Exception $e){
                Db::rollback();//回滚事务
                unset($data);
                $data['code'] = 0;
                $data['msg'] = '操作失败';
                return json_encode($data);
            }
        }
    }
    public function delchain(){
        $id = intval($_GET['id']);
        $data['status'] = 2;
        $data['update_time'] = date('Y-m-d H:i:s');
        $re = Db::table('af_chain')
            ->where('id',$id)
            ->update($data);
        if($re){
            unset($data);
            $data['code'] = 200;
            $data['msg'] = '删除成功';
            return json_encode($data);
        }else{
            unset($data);
            $data['code'] = 0;
            $data['msg'] = '操作失败';
            return json_encode($data);
        }
    }

}
