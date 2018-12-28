<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/1
 * Time: 17:25
 */

namespace app\api\validate;


class IDMustPositiveInt extends BaseValidate
{
    protected $rule = [
        'id' => 'require|IsPositiveInt'
    ];
}