<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/1
 * Time: 17:54
 */

namespace app\api\model;


class Image extends BaseModel
{
    protected $hidden = ['id','delete_time','update_time'];

    public function getUrlAttr($value,$data)
    {
        return $this->prefixImgUrl($value,$data);
    }
}