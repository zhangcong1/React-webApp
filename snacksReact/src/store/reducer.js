import { combineReducers } from 'redux-immutable';
import { reducer as homeReducer } from '../page/home/store';
import { reducer as categoryReducer } from '../page/category/store';
const reducer = combineReducers({
    home: homeReducer,
    category: categoryReducer,
});
export default reducer;