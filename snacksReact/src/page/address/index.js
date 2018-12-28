import React,{ Component } from 'react';
import './style.scss';
import { Input, Cascader, message  } from 'antd';


class Address extends Component{
    constructor(props){
        super(props);
        this.state = {
            name: '',
            phone: '',
            detail: '',
            location: [],
            options: [{
                value: '浙江',
                label: '浙江',
                children: [{
                    value: '杭州',
                    label: '杭州',
                    children: [{
                        value: '西湖区',
                        label: '西湖区',
                    },{
                        value: '拱墅区',
                        label: '拱墅区',
                    },{
                        value: '余杭区',
                        label: '余杭区',
                    }],
                }],
            }, {
                value: '江苏',
                label: '江苏',
                children: [{
                    value: '南京',
                    label: '南京',
                    children: [{
                        value: '中华门',
                        label: '中华门',
                    }],
                }],
            }]
        };
        this.getName = this.getName.bind(this);
        this.getPhone = this.getPhone.bind(this);
        this.getDetail = this.getDetail.bind(this);
        this.getChange = this.getChange.bind(this);
        this.getAddress = this.getAddress.bind(this);
    }
    componentDidMount() {
        let address = JSON.parse(localStorage.getItem('address'));
        if (address !== null){
            this.setState({
                name: address.name,
                phone: address.phone,
                location: address.location,
                detail: address.detail
            })
        }
    }

    getName(event){
        this.setState({
            name: event.target.value
        })
    }
    getPhone(event){
        this.setState({
            phone: event.target.value
        })
    }
    getDetail(event){
        this.setState({
            detail: event.target.value
        })
    }
    getChange(value){
        this.setState({
            location: value
        })
    }
    getAddress(){
        let { name,phone,detail,location } = this.state;
        if (name === '' || phone === '' || detail === '' || location === []){
            message.error('请将地址填写完整');
            return false;
        }else if (phone.length !== 11){
            message.error('手机号码错误');
            return false;
        }
        let obj = {};
        obj['name'] = name;
        obj['phone'] = phone;
        obj['detail'] = detail;
        obj['location'] = location;
        localStorage.setItem('address',JSON.stringify(obj));
        this.props.history.go(-1);
    }
    render() {
        let { name,phone,detail,options,location } = this.state;
        return (
            <div className="address-box1">
                <div className="info-box">
                    <Input ref='asd' placeholder="收货人" className='input' value={name} onChange={(event)=>this.getName(event)}/>
                    <Input placeholder="手机号码" className='input' value={phone} onChange={(event)=>this.getPhone(event)}/>
                    <Cascader options={options} value={location} onChange={(value)=>this.getChange(value)} placeholder="所在地区" className='input'/>
                    <Input placeholder="详细收货地址" className='input' value={detail} onChange={(event)=>this.getDetail(event)} />
                </div>
                <div className="save" onClick={()=>this.getAddress()}>
                    保 存
                </div>
            </div>
        );
    }
}

export default Address;