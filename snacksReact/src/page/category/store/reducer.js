import { fromJS } from 'immutable';
import * as constants from './constants';
const defaultState = fromJS({
    category: [],
    catIndex: 0,
    cateproduct0: {'topImgUrl':'','title':'','products':[]},
    cateproduct1: {'topImgUrl':'','title':'','products':[]},
    cateproduct2: {'topImgUrl':'','title':'','products':[]},
    cateproduct3: {'topImgUrl':'','title':'','products':[]},
    cateproduct4: {'topImgUrl':'','title':'','products':[]},
    cateproduct5: {'topImgUrl':'','title':'','products':[]},
});

export default (state = defaultState,action) => {
    switch (action.type) {
        case constants.CATEGORY_DATA:
            return state.set('category',fromJS(action.category));
        case constants.CATEGORY_ITEM:
            let dataobj = {};
            dataobj['topImgUrl'] = state.get('category').toJS()[action.catIndex].img.url;
            dataobj['title'] = state.get('category').toJS()[action.catIndex].name;
            dataobj['products'] = action.catProduct;
            let obj = {};
            obj['cateproduct'+action.catIndex] = fromJS(dataobj);
            obj['catIndex'] = action.catIndex;
            return state.merge(obj);
        case constants.CATEGORY_INDEX:
            return state.set('catIndex',action.catIndex);
        default:
            return state;
    }
}