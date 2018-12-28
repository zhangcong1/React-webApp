<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/1
 * Time: 17:52
 */

namespace app\api\model;


class BannerItem extends BaseModel
{
    protected $hidden = ['banner_id','img_id','delete_time','update_time'];

    public function img(){
        return $this->belongsTo('Image','img_id','id');
    }
}