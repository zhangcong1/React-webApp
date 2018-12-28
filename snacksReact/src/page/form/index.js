import React,{ Component } from 'react';
import './style.scss';
import {
    Form, Icon, Input, Button, message
} from 'antd';

const FormItem = Form.Item;
const error = () => {
    message.error('账号或密码错误');
};

class NormalLoginForm extends Component {
    handleSubmit = (e) => {
        e.preventDefault();
        let that = this;
        this.props.form.validateFields((err, values) => {
            if (!err) {
                console.log('Received values of form: ', values);
                fetch('/ajax/app/public/api/v1/userlogin',{
                    method:'POST',
                    headers: {
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    body:JSON.stringify({account:values.account,password:values.password})
                }).then((e)=>{
                    return e.text();
                }).then((e)=>{
                    if (e.trim() === 'accountNotFound'){
                        error();
                    }else if (e.trim() === 'passwordError'){
                        error();
                    } else if (e.trim() === 'success'){
                        that.props.router.go(-1);
                        sessionStorage.setItem('userLoginToken','login');
                    }
                })
            }
        });
    }

    render() {
        const { getFieldDecorator } = this.props.form;
        return (
            <Form onSubmit={this.handleSubmit} className="login-form">
                <FormItem>
                    {getFieldDecorator('account', {
                        rules: [{ required: true, message: '请输入账户!' }],
                    })(
                        <Input prefix={<Icon type="user" style={{ color: 'rgba(0,0,0,.25)' }} />} placeholder="请输入账户" />
                    )}
                </FormItem>
                <FormItem>
                    {getFieldDecorator('password', {
                        rules: [{ required: true, message: '请输入密码!' }],
                    })(
                        <Input prefix={<Icon type="lock" style={{ color: 'rgba(0,0,0,.25)' }} />} type="password" placeholder="请输入密码" />
                    )}
                </FormItem>
                <FormItem>
                    <Button type="primary" htmlType="submit" className="login-form-button">
                        登录
                    </Button>
                    Or <a href="/">注册</a>
                </FormItem>
            </Form>
        );
    }
}

const WrappedNormalLoginForm = Form.create()(NormalLoginForm);

export default WrappedNormalLoginForm;