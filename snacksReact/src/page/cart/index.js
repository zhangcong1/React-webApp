import React,{ Component } from 'react';
import { connect } from 'react-redux';
import Tab from '../tab';
import './style.scss';
import circelNoSelece from '../../static/circle@noselected.png';
import circelSelece from '../../static/circle@selected.png';
import all from '../../static/all.png';
import allSelect from '../../static/all@selected.png';
import arrow from '../../static/arrow.png';

class Cart extends Component{
    constructor(props){
        super(props);
        this.state = {
            data: []
        }
        this.add = this.add.bind(this);
        this.del = this.del.bind(this);
        this.delete = this.delete.bind(this);
        this.checkSelect = this.checkSelect.bind(this);
        this.toggleSelectAll = this.toggleSelectAll.bind(this);
        this.goOrder = this.goOrder.bind(this);
    }
    componentDidMount() {
        let cart = JSON.parse(localStorage.getItem('cart'));
        if (cart === null){
            this.setState({
                data: []
            })
        } else {
            let calc = this.calcTotalAccountAndCounts(cart);
            this.setState({
                selectedCounts: calc.selectedCounts,
                account: calc.account,
                selectedTypeCounts: calc.selectedTypeCounts,
                data: cart
            })
        }
    }
    calcTotalAccountAndCounts(data){
        let selectedCounts = 0;
        let selectedTypeCounts = 0;
        let account = 0;
        let multiple = 100;
        for (let i=0;i<data.length;i++){
            if (data[i].selectStatus){
                selectedCounts += data[i].count;
                account += data[i].price * multiple * data[i].count * multiple;
                selectedTypeCounts++;
            }
        }
        return {
            selectedCounts: selectedCounts,
            account: account/(multiple * multiple),
            selectedTypeCounts: selectedTypeCounts
        }
    }
    add(id){
        let index = this.getIndex(id);
        let data = JSON.parse(JSON.stringify(this.state.data));
        data[index].count += 1;
        if (data[index].count>10){
            return false;
        }
        this.resetCartData(data);
    }
    del(id){
        let index = this.getIndex(id);
        let data = JSON.parse(JSON.stringify(this.state.data));
        data[index].count -= 1;
        if (data[index].count<1){
            return false;
        }
        this.resetCartData(data);
    }
    getIndex(id){
        let data = this.state.data;
        for (let i=0;i<data.length;i++){
            if (data[i].id === id){
                return i;
            }
        }
    }
    resetCartData(data){
        let calc = this.calcTotalAccountAndCounts(data);
        this.setState({
            selectedCounts: calc.selectedCounts,
            account: calc.account,
            selectedTypeCounts: calc.selectedTypeCounts,
            data: data
        });
        localStorage.setItem('cart',JSON.stringify(data))
    }
    delete(id){
        let index = this.getIndex(id);
        let data = JSON.parse(JSON.stringify(this.state.data));
        data.splice(index,1);
        this.resetCartData(data);
    }
    checkSelect(id){
        let index = this.getIndex(id);
        let data = JSON.parse(JSON.stringify(this.state.data));
        data[index].selectStatus = !data[index].selectStatus;
        this.resetCartData(data);
    }
    toggleSelectAll(){
        let status = this.state.data.length === this.state.selectedTypeCounts ? true : false;
        let data = JSON.parse(JSON.stringify(this.state.data));
        for (let i=0;i<data.length;i++){
            data[i].selectStatus = !status;
        }
        this.resetCartData(data);
    }
    goOrder(){
        if(this.state.account===0){
            return false;
        }
        this.props.history.push('/order?account='+this.state.account+'&from=cart');
    }
    render() {
        const { data,selectedTypeCounts,selectedCounts,account } = this.state;
        return (
            <div>
                {
                    data.length>0?(
                        <div className="cart-container">
                            <ul className='cart-list'>
                                {
                                    data.map((item)=>{
                                        return (
                                            <li key={item.id}>
                                                <div className='cart-item-checkbox' onClick={()=>this.checkSelect(item.id)}>
                                                    {
                                                        item.selectStatus?(
                                                            <img src={circelSelece} alt=""/>
                                                        ):(
                                                            <img src={circelNoSelece} alt=""/>
                                                        )
                                                    }
                                                </div>
                                                <div className='cart-item-img'>
                                                    <img src={item.main_img_url} alt=""/>
                                                </div>
                                                <div className="cart-item-word">
                                                    <div className="title-box">
                                                        <span>{item.name}</span>
                                                        <span>￥ {item.price}</span>
                                                    </div>
                                                    <div className="bottom-box">
                                                        <div className="cart-item-counts">
                                                            <div className='del' onClick={()=>this.del(item.id)}>-</div>
                                                            <div>{item.count}</div>
                                                            <div className='add' onClick={()=>this.add(item.id)}>+</div>
                                                        </div>
                                                        <div className="delete"  onClick={()=>this.delete(item.id)}>X</div>
                                                    </div>
                                                </div>
                                            </li>
                                        )
                                    })
                                }
                            </ul>
                            <div className="footer-account-box">
                                <div className="all-select" onClick={()=>this.toggleSelectAll()}>
                                    {
                                        selectedTypeCounts===data.length?(
                                            <img src={allSelect} alt=""/>
                                        ):(
                                            <img src={all} alt=""/>
                                        )
                                    }
                                    <span>全选({selectedCounts})</span>
                                </div>
                                <div className="all-price-submit" style={account===0?{color: '#e6e6e6'}:{}} onClick={()=>this.goOrder()}>
                                    <div className="accounts-btn">下单</div>
                                    <div className="price-text">￥ {account}</div>
                                    <div className="arrow-icon">
                                        <img src={arrow} alt=""/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    ):(
                        <div className='noData'>您还没有添加任何商品！</div>
                    )
                }
                <Tab path='/cart' />
            </div>
        );
    }
    componentWillMount() {
        if (!sessionStorage.getItem('userLoginToken')){
            this.props.history.push('/login');
        }
        /*let that = this;
        fetch('/ajax/app/public/api/v1/login').then((e)=>{
            return e.text();
        }).then((e)=>{
            if (e.trim() === 'false'){
                that.props.history.push('/login');
            }
        })*/
    }

}

export default connect()(Cart);