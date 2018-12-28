<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
use think\Route;
//Banner
Route::get('api/:version/banner/:id','api/:version.Banner/getBanner');
//Theme
Route::group('api/:version/theme',function (){
    Route::get('/:id','api/:version.Theme/getThemeDetail');
    Route::get('','api/:version.Theme/getTheme');
});
//Product
Route::group('api/:version/product',function (){
    Route::get('/recent','api/:version.Product/getRecent');
    Route::get('/by_category','api/:version.Product/getAllInCategory');
    Route::get('/:id','api/:version.Product/getOne');
});
//Category
Route::get('api/:version/category/all', 'api/:version.Category/getAllCategories');
//Login
Route::get('api/:version/login','api/:version.Login/checkLogin');
Route::post('api/:version/userlogin','api/:version.Login/userLogin');
Route::get('api/:version/loginout','api/:version.Login/loginOut');
//Address
Route::get('api/:version/address','api/:version.Address/getAddress');