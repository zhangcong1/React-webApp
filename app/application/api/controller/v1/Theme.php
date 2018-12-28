<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/3
 * Time: 16:25
 */

namespace app\api\controller\v1;


use app\api\validate\IDCollection;
use app\api\model\Theme as ThemeModel;
use app\api\validate\IDMustPositiveInt;

class Theme
{
    public function getTheme($ids)
    {
        (new IDCollection())->gocheck();
        $ids = explode(',',$ids);
        $result = ThemeModel::with('topicImg,headImg')->select($ids);
        if (!$result){
            throw new MissException([
                "msg" => '指定主题不存在，请检查主题ID',
                "errorCode" => 30000
            ]);
        }
        return json($result);
    }

    public function getThemeDetail($id)
    {
        (new IDMustPositiveInt())->gocheck();
        $theme = ThemeModel::getThemeWithProducts($id);
        return json($theme);
    }
}