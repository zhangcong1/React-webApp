<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/1
 * Time: 17:19
 */

namespace app\api\validate;


use app\lib\exception\ParamException;
use think\Request;
use think\Validate;

class BaseValidate extends Validate
{
    public function gocheck(){
        $request = Request::instance();
        $params = $request->param();
        $result = $this->batch()->check($params);
        if (!$result){
            throw new ParamException([
                'msg' => $this->error
            ]);
        }else{
            return true;
        }
    }
    //校验正整数
    protected function IsPositiveInt($value)
    {
        if (is_numeric($value) && is_int($value+0) && ($value+0)>0){
            return true;
        }else{
            return false;
        }
    }
}