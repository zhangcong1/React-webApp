import React, { Component } from 'react';
import './style.scss';
import { Icon  } from "antd";

class Order extends Component{
    constructor(props){
        super(props);
        let search = this.props.location.search;
        let account = search.split('&')[0].split('=')[1];
        let from = search.split('&')[1].split('=')[1];
        this.state = {
            account,
            from,
            orderData: [],
            address: null,

            pay: false
        };
        this.addAddress = this.addAddress.bind(this);
        this.goPay = this.goPay.bind(this);
        this.payEntrue = this.payEntrue.bind(this);
        this.payCancel = this.payCancel.bind(this);
    }
    componentDidMount() {
        let data = JSON.parse(localStorage.getItem('cart'));
        let orderData = [];
        for (let i=0;i<data.length;i++){
            if (data[i].selectStatus){
                orderData.push(data[i])
            }
        }
        this.setState({
            orderData
        });
        let address = JSON.parse(localStorage.getItem('address'));
        if (address !== null){
            this.setState({
                address: address
            })
        }
    }
    addAddress(){
        this.props.history.push('/address');
    }

    goPay(){
        this.setState({
            pay: true
        })
    }
    payEntrue(){
        let obj = {};
        obj['time'] = new Date().toLocaleString('chinese',{hour12: false});
        obj['number'] = new Date().getTime();
        obj['payStatus'] = true;
        obj['address'] = this.state.address;
        obj['account'] = this.state.account;
        obj['data'] = this.state.orderData;
        obj['id'] = 1;
        let pay = JSON.parse(localStorage.getItem('pay'));
        if (pay === null){
            let arr = [];
            arr.push(obj);
            localStorage.setItem('pay',JSON.stringify(arr));
        }else {
            obj['id'] = pay[pay.length-1].id+1;
            pay.push(obj);
            localStorage.setItem('pay',JSON.stringify(pay));
        }
        localStorage.removeItem('cart');
        this.props.history.push('/my');
        // this.props.history.push('/pay');
    }
    payCancel(){
        let obj = {};
        obj['time'] = new Date().toLocaleString('chinese',{hour12: false});
        obj['number'] = new Date().getTime();
        obj['payStatus'] = false;
        obj['address'] = this.state.address;
        obj['account'] = this.state.account;
        obj['data'] = this.state.orderData;
        obj['id'] = 1;
        let pay = JSON.parse(localStorage.getItem('pay'));
        if (pay === null){
            let arr = [];
            arr.push(obj);
            localStorage.setItem('pay',JSON.stringify(arr));
        }else {
            obj['id'] = pay[pay.length-1].id+1;
            pay.push(obj);
            localStorage.setItem('pay',JSON.stringify(pay));
        }
        this.props.history.push('/my');
        localStorage.removeItem('cart');
    }

    render() {
        const { account,orderData,address,pay } = this.state;
        return (
            <div className="order-container">
                {
                    address === null ? (
                        <div className="add-address" onClick={()=>this.addAddress()}>
                            <Icon type="plus" />
                            <span>添加收货地址</span>
                        </div>
                    ):(
                        <div className="address-box">
                            <div className='address-left'>
                                <div className='user-info'>
                                    <div className="name">
                                        <Icon type="user" className='icon'/>
                                        <span>{address.name}</span>
                                    </div>
                                    <div className="phone">
                                        <Icon type="mobile" className='icon' />
                                        <span>{address.phone}</span>
                                    </div>
                                </div>
                                <div className='address'>
                                    {address.location.join('')+address.detail}
                                </div>
                            </div>
                            <div className='address-right' onClick={()=>this.addAddress()}>
                                <Icon type="right" />
                            </div>
                        </div>
                    )
                }
                <ul>
                    {
                        orderData.map((item,key)=>{
                            return (
                                <li key={key}>
                                    <div className="left">
                                        <img src={item.main_img_url} alt=""/>
                                    </div>
                                    <div className="middle">
                                        <span>{item.name}</span>
                                        <span>￥ {item.price}</span>
                                    </div>
                                    <div className="right">
                                        <span>x {item.count}</span>
                                    </div>
                                </li>
                            )
                        })
                    }
                </ul>
                <div className="bottom">
                    <div className="bottom-left">
                        下单总额:  ￥{account}
                    </div>
                    <div className="bottom-right" onClick={()=>this.goPay()}>
                        去付款
                    </div>
                </div>
                <div className="pay-box" style={pay?{}:{display:'none'}}>
                    <div className="pay">
                        <div className="pay-title">提示</div>
                        <div className="pay-info">是否进行支付?</div>
                        <div className="pay-true-false">
                            <div className="pay-true" onClick={()=>this.payEntrue()}>确定</div>
                            <div className="pay-false" onClick={()=>this.payCancel()}>取消</div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Order;