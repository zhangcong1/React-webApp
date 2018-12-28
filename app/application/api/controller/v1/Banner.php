<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/1
 * Time: 16:57
 */

namespace app\api\controller\v1;


use app\api\validate\IDMustPositiveInt;
use app\api\model\Banner as BannerModel;
use app\lib\exception\MissException;

class Banner
{
    public function getBanner($id){
        (new IDMustPositiveInt())->gocheck();
        $result = BannerModel::getBannerByID($id);
        if (!$result){
            throw new MissException([
                'msg' => '请求的banner不存在',
                'errorCode' => 40000
            ]);
        }
        return json($result);
    }
}