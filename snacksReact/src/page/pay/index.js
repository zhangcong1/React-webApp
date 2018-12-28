import React,{ Component } from 'react';
import './style.scss';
import {Icon} from "antd";

class Pay extends Component{
    constructor(props){
        super(props);
        this.state = {
            id: this.props.match.params.id,
            data: {
                id: 0,
                time: '',
                number: '',
                payStatus: false,
                address: {
                    name: '',
                    phone: '',
                    location: [],
                    detail: ''
                },
                data: [],
                account: ''
            },
            pay: false
        }
        this.goPay = this.goPay.bind(this);
        this.payEntrue = this.payEntrue.bind(this);
        this.payCancel = this.payCancel.bind(this);
    }
    componentDidMount() {
        let pay = JSON.parse(localStorage.getItem('pay'));
        for (let i=0;i<pay.length;i++){
            if (parseInt(this.state.id) === pay[i].id){
                this.setState({
                    data: pay[i]
                })
            }
        }
    }
    goPay(){
        this.setState({
            pay: true
        })
    }
    payEntrue(){
        let pay = JSON.parse(localStorage.getItem('pay'));
        for (let i=0;i<pay.length;i++){
            if (parseInt(this.state.id) === pay[i].id){
                pay[i].payStatus = true;
            }
        }
        localStorage.setItem('pay',JSON.stringify(pay));
        this.props.history.push('/my');
    }
    payCancel(){
        this.props.history.push('/my');
    }

    render() {
        let { data,pay } = this.state;
        return (
            <div className="pay-result">
                <div className="base-info">
                    <div className="order-time-num">
                        <div className="order-time">
                            <span>下单时间: </span>
                            <span>{data.time}</span>
                        </div>
                        <div className="order-num">
                            <span>订单编号: </span>
                            <span>{data.number}</span>
                        </div>
                    </div>
                    <div className={data.payStatus?'pay order-status':'unpay order-status'}>
                        {data.payStatus?'已付款':'待付款'}
                    </div>
                </div>
                <div className="address-box">
                    <div className='address-left'>
                        <div className='user-info'>
                            <div className="name">
                                <Icon type="user" className='icon'/>
                                <span>{data.address.name}</span>
                            </div>
                            <div className="phone">
                                <Icon type="mobile" className='icon' />
                                <span>{data.address.phone}</span>
                            </div>
                        </div>
                        <div className='address'>
                            {data.address.location.join('')+data.address.detail}
                        </div>
                    </div>
                </div>
                <ul>
                    {
                        data.data.map((item)=>{
                            return (
                                <li key={item.id}>
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
                        下单总额:  ￥{data.account}
                    </div>
                    {
                        data.payStatus?(
                            <div>

                            </div>
                            ):(
                            <div className="bottom-right" onClick={()=>this.goPay()}>
                                去付款
                            </div>
                        )
                    }
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

export default Pay;