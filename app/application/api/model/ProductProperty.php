<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/19
 * Time: 9:57
 */

namespace app\api\model;


class ProductProperty extends BaseModel
{
    protected $hidden = ['id','product_id','delete_time','update_time'];
}