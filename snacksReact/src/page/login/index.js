import React,{ Component } from 'react';
import './style.scss';
import { Icon } from 'antd';
import Form from '../form';

class Index extends Component{
    constructor(props){
        super(props);
        this.back = this.back.bind(this);
    }
    back(){
        this.props.history.go(-2);
    }
    render() {
        const router = this.props.history;
        return (
            <div className='containers'>
                <div className='head-nav'>
                    <Icon type="arrow-left" className='back' onClick={()=>this.back()}/>
                </div>
                <div className='logo-box'>
                    <div className='logo'/>
                </div>
                <div style={{padding:'0 .3rem'}}>
                    <Form router={router} />
                </div>
            </div>
        );
    }
}

export default Index;