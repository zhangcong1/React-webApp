<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/17
 * Time: 13:54
 */

namespace app\api\controller\v1;


use app\api\model\Users;
use think\Request;
use app\api\model\Users as usersModel;

class Login
{
    public function checkLogin()
    {
        if (isset($_SESSION['userLoginToken'])){
            return 'true';
        }else{
            return 'false';
        }
    }

    public function userLogin()
    {
        $account = Request::instance()->post('account');
        $password = Request::instance()->post('password');
        $result = usersModel::get(['account'=>$account]);
        if (!$result){
            return 'accountNotFound';
        }else{
            $ret = usersModel::get(['account'=>$account,'password'=>$password]);
            if (!$ret){
                return 'passwordError';
            }else{
                $_SESSION['account'] = $account;
                $_SESSION['userLoginToken'] = 'login';
                echo 'success';
            }
        }
    }

    public function loginOut()
    {
        unset($_SESSION['account']);
        unset($_SESSION['userLoginToken']);
        return 'true';
    }
}