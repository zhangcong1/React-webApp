import React, { Component } from 'react';
import Tab from '../tab';
import './style.scss';
import { Icon } from 'antd';

class My extends Component{
    constructor(props){
        super(props);
        this.state = {
            address: null,
            myorder: []
        }
        this.loginout = this.loginout.bind(this);
        this.addAddress = this.addAddress.bind(this);
        this.goPay = this.goPay.bind(this);
    }
    loginout(){
        sessionStorage.removeItem('userLoginToken');
        this.props.history.push('/login')
        /*fetch('/ajax/app/public/api/v1/loginout').then((e)=> {
            return e.text();
        }).then((e) => {
            console.log(e)
        })*/
    }
    componentDidMount() {
        let address = JSON.parse(localStorage.getItem('address'));
        if (address !== null){
            this.setState({
                address: address
            })
        }
        let myorder = JSON.parse(localStorage.getItem('pay'));
        console.log(myorder)
        if (myorder !== null){
            this.setState({
                myorder: myorder
            })
        }
    }

    addAddress(){
        this.props.history.push('/address');
    }

    goPay(id){
        this.props.history.push('/pay/'+id);
    }

    render() {
        let { address,myorder } = this.state;
        return (
            <div style={{background:'#EDEDED'}}>
                <div className="header">
                    <Icon type="setting" style={{opacity:'0'}}/>
                    <span>零食商贩</span>
                    <Icon type="setting" />
                </div>
                <div className='info'>
                    <div className='headImg' />
                    <span className='nick'>零食商贩</span>
                </div>
                {
                    address === null? (
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
                <div className="my-order">
                    <div className="order-title">我的订单</div>
                    <div className="order-main">
                        {
                            myorder.map((item,key)=>{
                                let count = 0;
                                for (let i=0;i<item.data.length;i++){
                                    count += item.data[i].count;
                                }
                                return (
                                    <div className="order-item" key={key} onClick={()=>this.goPay(item.id)}>
                                        <div className="item-header">
                                            <span>订单编号: </span>
                                            <span>{item.number}</span>
                                        </div>
                                        <div className="item-main">
                                            <div className="item-main-left">
                                                <img src={item.data[0].main_img_url} alt=""/>
                                            </div>
                                            <div className="item-main-middle">
                                                <div>{item.data[0].name}</div>
                                                <div>{count}件商品</div>
                                            </div>
                                            <div className={item.payStatus?'item-main-right pay':'item-main-right unpay'}>
                                                {item.payStatus?'已付款':'待付款'}
                                            </div>
                                        </div>
                                        <div className="item-footer">
                                            <span>实付: ￥{item.account}</span>
                                            {item.payStatus?(
                                                <div/>
                                            ):(
                                                <div className="order-pay">
                                                    付款
                                                </div>
                                            )}

                                        </div>
                                    </div>
                                )
                            })
                        }
                    </div>
                </div>
                <div className='exit-login' onClick={()=>this.loginout()}>退出登录</div>
                <Tab path='/my' />
            </div>
        );
    }
    componentWillMount() {
        // let that = this;
        if (!sessionStorage.getItem('userLoginToken')){
            this.props.history.push('/login');
        }
        /*fetch('/ajax/app/public/api/v1/login').then((e)=>{
            return e.text();
        }).then((e)=>{
            if (e.trim() === 'false'){
                that.props.history.push('/login');
            }
        })*/
    }
}

export default My;