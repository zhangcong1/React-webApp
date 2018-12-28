import React,{ Component } from 'react';
import { connect } from 'react-redux';
import { actionCreators } from './store';
import Tab from '../tab';
import Catedetail from './component/catedetail';
import './style.scss';

class Category extends Component{
    componentWillMount(){
        this.props.getCategory(this);
        // let id = this.props.category[0].id
        // this.props.getDefaultPro(id,this);
    }
    render(){
        const { category,catIndex,categoryItemTap,cateproduct0,cateproduct1,cateproduct2,cateproduct3,cateproduct4,cateproduct5 } = this.props;
        return (
            <div className="category-box">
                <ul className='left'>
                    {
                        category.map((item,key) => {
                            return (
                                <li key={key} className={catIndex === key?'selected':''} onClick={()=>categoryItemTap(key,item.id,this)}>{item.name}</li>
                            )
                        })
                    }
                </ul>
                <div className={'transition'+catIndex+' right'}>
                    <Catedetail cateproductInfo={cateproduct0} router={this.props.history} />
                    <Catedetail cateproductInfo={cateproduct1} router={this.props.history} />
                    <Catedetail cateproductInfo={cateproduct2} router={this.props.history} />
                    <Catedetail cateproductInfo={cateproduct3} router={this.props.history} />
                    <Catedetail cateproductInfo={cateproduct4} router={this.props.history} />
                    <Catedetail cateproductInfo={cateproduct5} router={this.props.history} />
                </div>
                <Tab path='/category' />
            </div>
        )
    }

}

const mapState = (state) => ({
    category: state.getIn(['category','category']).toJS(),
    catIndex: state.getIn(['category','catIndex']),
    cateproduct0: state.getIn(['category','cateproduct0']).toJS(),
    cateproduct1: state.getIn(['category','cateproduct1']).toJS(),
    cateproduct2: state.getIn(['category','cateproduct2']).toJS(),
    cateproduct3: state.getIn(['category','cateproduct3']).toJS(),
    cateproduct4: state.getIn(['category','cateproduct4']).toJS(),
    cateproduct5: state.getIn(['category','cateproduct5']).toJS(),
});

const mapDispach = (dispach) => ({
    getCategory(that){
        if (that.props['cateproduct0'].topImgUrl === '') {
            dispach(actionCreators.getCategory());
        }
    },
    getDefaultPro(id,that){
        if (that.props['cateproduct0'].topImgUrl === ''){
            dispach(actionCreators.categoryItemTap(0,id));
        }
    },
    categoryItemTap(key,id,that){
        if (that.props['cateproduct'+key].topImgUrl === ''){
            dispach(actionCreators.categoryItemTap(key,id));
        }else {
            dispach(actionCreators.changecatIndex(key))
        }
    }
});

export default connect(mapState,mapDispach)(Category);