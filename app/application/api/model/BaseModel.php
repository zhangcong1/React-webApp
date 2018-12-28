<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/1
 * Time: 17:49
 */

namespace app\api\model;


use think\Model;

class BaseModel extends Model
{
    //图片完整路径，添加前缀
    public function prefixImgUrl($value,$data)
    {
        $finalUrl = config("setting.img_prefix").$value;
        return $finalUrl;
    }
}