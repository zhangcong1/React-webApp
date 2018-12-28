import { fromJS } from 'immutable';
import * as constants from './constants';
const defaultState = fromJS({
    'aa': 'aa',
    banner_list: [],
    theme_list: [],
    product_list: []
});

export default (state = defaultState,action) => {
    switch (action.type){
        case constants.CHANGE_DATA:
            return state.set('aa','bb');
        case constants.BANNER_DATA:
            return state.set('banner_list',action.banner_list);
        case constants.THEME_DATA:
            return state.set('theme_list',action.theme_list);
        case constants.PRODUCT_DATA:
            return state.set('product_list',action.product_list);
        default:
            return state;
    }
}