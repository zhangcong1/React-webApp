import * as constants from './constants';

export const changeData = () => ({
    type: constants.CHANGE_DATA
});

export const getBanner = (callback) => {
    return (dispach) => {
        fetch(constants.PRE_URL+'/api/v1/banner/1').then((e)=>{
            return e.json();
        }).then((e)=>{
            let result = e.item;
            dispach(getBannerData(result));
            callback();
        })
    }
};
const getBannerData = (result) => ({
    type: constants.BANNER_DATA,
    banner_list: result
});

export const getTheme = () => {
    return (dispach) => {
        fetch(constants.PRE_URL+'/api/v1/theme?ids=1,2,3').then((e)=>{
            return e.json();
        }).then((e)=>{
            dispach(getThemeData(e));
        })
    }
};
const getThemeData = (result) => ({
    type: constants.THEME_DATA,
    theme_list: result
});

export const getProduct = () => {
    return (dispach) => {
        fetch(constants.PRE_URL+'/api/v1/product/recent').then((e)=>{
            return e.json();
        }).then((e)=>{
            dispach(getProductData(e));
        })
    }
};
const getProductData = (result) => ({
    type: constants.PRODUCT_DATA,
    product_list: result
});