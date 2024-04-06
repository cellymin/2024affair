<?php

namespace app\index\model;

use think\Model;
use think\Db;

class Grade extends Model
{
    /*
     * 找上级 优先在同部门找 找不到找网络部上级
     * */
    function getPreGrade($gid='', $depart_id='')
    {
        $user =  Db::table('af_user')
            ->where('status', 1)
            ->where('department_id', $depart_id)
            ->where('grade_id', $gid)
            ->select();
        $maxgrade = $this->getTopgrade($depart_id);
        if($gid==$maxgrade){
            return $user;
        }
        $fid = Db::table('af_grade')
            ->where('status', 1)
            ->where('id', $gid)
            ->find();
        if (empty($fid)) {
            return false;
        } else {
            if ($fid['parent_id'] == 1) {
                return false;
            } else {
                $pregrade = $this->getTongGrade($fid['parent_id'], $depart_id);
                if (!empty($pregrade)) {
                    if($fid['parent_id'] == $pregrade ){
                        //自己是本部门最高级 找网络部上级
                        $pregrade = $this->getUnTongGrade($fid['parent_id']);
                        if($fid['parent_id'] == $pregrade ) {
                           return $user;
                        }else{
                            return $pregrade;
                        }
                    }else{
                        return $pregrade;
                    }
                } else {
                    $pregrade = $this->getUnTongGrade($fid['parent_id']);
                    if($fid['parent_id'] == $pregrade ) {
                        return $user;
                    }else{
                        return $pregrade;
                    }
                }
            }
        }
    }

    function getTongGrade($fid='', $depart_id='')
    {
        $maxg =  Db::table('af_user')
            ->where('status', 1)
            ->where('department_id', $depart_id)
            ->min('grade_id');
        if(empty($maxg)){
            return  false;
        }else if($fid==$maxg){
            return $fid;
        }else if($fid>$maxg){
            $re = Db::table('af_user')
                ->where('status', 1)
                ->where('department_id', $depart_id)
                ->where('grade_id', $fid)
                ->select();
            if ($re) {
                return $re;
            } else {
                $ffid = Db::table('af_grade')
                    ->where('status', 1)
                    ->where('id', $fid)
                    ->find();
                return $this->getTongGrade($ffid['parent_id']);
            }
        }
    }

    function getUnTongGrade($fid='')
    {
        $maxg =  Db::table('af_user')
            ->where('status', 1)
            ->min('grade_id');
        if(empty($maxg)){
            return  false;
        }else if($fid==$maxg){
            return $fid;
        }else if($fid>$maxg) {

            $re = Db::table('af_user')
                ->where('status', 1)
                ->where('grade_id', $fid)
                ->select();
            if ($re) {
                return $re;
            } else {
                $ffid = Db::table('af_grade')
                    ->where('status', 1)
                    ->where('id', $fid)
                    ->find();
                return $this->getUnTongGrade($ffid['parent_id']);
            }
        }
    }
    function getTopgrade($depart_id=''){
        if($depart_id>0){
            $re = Db::table('af_user')
                ->where('department_id', $depart_id)
                ->min('grade_id');
        }else{
            $re = Db::table('af_user')
                ->min('grade_id');
        }

        return $re;
    }

}
