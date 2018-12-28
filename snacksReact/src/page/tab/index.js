import React,{ Component,Fragment } from 'react';
import home from '../../static/tab/home.png';
import homeSelect from '../../static/tab/home@selected.png';
import category from '../../static/tab/category.png';
import categorySelect from '../../static/tab/category@selected.png';
import cart from '../../static/tab/cart.png';
import cartSelect from '../../static/tab/cart@selected.png';
import my from '../../static/tab/my.png';
import mySelect from '../../static/tab/my@selected.png';
import './style.scss';

import { Link } from 'react-router-dom';

class Tab extends Component{
    constructor(props){
        super(props);
        this.state = {
            list: [
                {'icon':home,'name':'主页','select':0,'iconSelect':homeSelect,'url': '/'},
                {'icon':category,'name':'分类','select':1,'iconSelect':categorySelect,'url': '/category'},
                {'icon':cart,'name':'购物车','select':2,'iconSelect':cartSelect,'url': '/cart'},
                {'icon':my,'name':'我的','select':3,'iconSelect':mySelect,'url': '/my'},
            ],
            selected: 0
        };
        this.changeTab = this.changeTab.bind(this);
    }
    componentWillMount() {
        for (let i=0;i<this.state.list.length;i++){
            if (this.props.path === this.state.list[i].url){
                this.setState({
                    selected: this.state.list[i].select
                })
            }
        }
    }

    changeTab(index){
        this.setState({
            selected: index
        })
    }
    render(){
        const { list,selected } = this.state;
        return (
            <Fragment>
                <ul className="tab-box">
                    {
                        list.map((item,index) => {
                            return (
                                <li key={index} onClick={()=>this.changeTab(index)}>
                                    <Link to={item.url} className='url'>
                                        <div className='content'>
                                            <img src={selected===index?item.iconSelect:item.icon} alt=""/>
                                            <span className={selected===index?'active':''}>{item.name}</span>
                                        </div>
                                    </Link>
                                </li>
                            )
                        })
                    }
                </ul>
                {/*<div className='bottom' />*/}
            </Fragment>
        )
    }

}

export default Tab;