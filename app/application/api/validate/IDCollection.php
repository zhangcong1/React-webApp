<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/3
 * Time: 16:37
 */

namespace app\api\validate;


class IDCollection extends BaseValidate
{
    protected $rule = [
        'ids' => 'require|checkIDs'
    ];

    public function checkIDs($value)
    {
        $values = explode(',',$value);
        if (empty($values)){
            return false;
        }
        foreach ($values as $id){
            if (!$this->IsPositiveInt($id)){
                //必须是正整数
                return false;
            }
        }
        return true;
    }
}