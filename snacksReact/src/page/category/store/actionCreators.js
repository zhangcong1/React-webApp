import * as constants from './constants';
import * as constantsURL from '../../../store/constants';
export const getCategory = () => {
    return (dispach) => {
        fetch(constantsURL.PRE_URL+'/api/v1/category/all').then((e) => {
            return e.json();
        }).then((e) => {
            dispach(getCategoryData(e));
            fetch(constantsURL.PRE_URL+'/api/v1/product/by_category?id='+e[0].id).then((e) => {
                return e.json();
            }).then((e1) => {
                dispach(categoryItemTapData(0,e1))
            })
        });
    }
};
const getCategoryData = (result) => ({
    type: constants.CATEGORY_DATA,
    category: result,
});

export const categoryItemTap = (key,id) => {
    return (dispatch) => {
        fetch(constantsURL.PRE_URL+'/api/v1/product/by_category?id='+id).then((e) => {
            return e.json();
        }).then((e) => {
            dispatch(categoryItemTapData(key,e));
        })
    }
};
const categoryItemTapData = (key,e) => ({
    type: constants.CATEGORY_ITEM,
    catIndex: key,
    catProduct: e
});

export const changecatIndex = (key) => ({
    type: constants.CATEGORY_INDEX,
    catIndex: key
});
