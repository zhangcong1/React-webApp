<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/19
 * Time: 9:56
 */

namespace app\api\model;


class ProductImage extends BaseModel
{
    protected $hidden = ['id','img_id','order','product_id','delete_time','update_time'];

    public function img()
    {
        return $this->belongsTo("Image","img_id","id");
    }
}