<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2018/12/4
 * Time: 17:51
 */

namespace app\api\controller\v1;
use app\api\model\Category as CategoryModel;
use app\lib\exception\MissException;

class Category
{
    public function getAllCategories()
    {
        $categories = CategoryModel::all([],'img');
        if(!$categories){
            throw new MissException([
                'msg' => '还没有任何类目',
                'errorCode' => 50000
            ]);
        }
        return json($categories);
    }
}