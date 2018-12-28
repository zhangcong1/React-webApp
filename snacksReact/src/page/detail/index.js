import React,{ Component } from 'react';
import './style.scss';
import fixedCart from '../../static/cart@top.png';
import Cart from '../../static/cart.png';
import { Icon } from "antd";

class Detail extends Component{
    constructor(props){
        super(props);
        this.state = {
            data: {},
            tabs: ['商品详情','产品参数','售后保障'],
            tabselect: 0,
            count: 1,
            cartCount: 0
        }
        this.changeTabs = this.changeTabs.bind(this);
        this.add = this.add.bind(this);
        this.del = this.del.bind(this);
        this.addCart = this.addCart.bind(this);
        this.goCart = this.goCart.bind(this);
    }
    componentWillMount() {
        let id = this.props.match.params.id;
        fetch('/ajax/app/public/api/v1/product/'+id).then((e)=>{
            return e.json();
        }).then((e)=>{
            this.setState({
                data: e
            });
        })
        let cart = JSON.parse(localStorage.getItem('cart'));
        if (cart === null){
            this.setState({
                cartCount: 0
            })
        }else {
            let count = 0;
            for (let i=0;i<cart.length;i++){
                count += cart[i].count;
            }
            console.log(count)
            this.setState({
                cartCount: count
            })
        }
    }

    changeTabs(key){
        this.setState({
            tabselect: key
        })
    }
    add(){
        let count = this.state.count+1;
        if (count > 10){
            return false;
        }
        this.setState({
            count: count
        })
    }
    del(){
        let count = this.state.count-1;
        if (count < 1){
            return false;
        }
        this.setState({
            count: count
        })
    }
    addCart(){
        if (!sessionStorage.getItem('userLoginToken')) {
            this.props.history.push('/login');
            return false;
        }
        let cartCount = this.state.cartCount + this.state.count;
        this.setState({
            cartCount: cartCount
        });
        let { id,name,price,main_img_url } = this.state.data
        let cart = JSON.parse(localStorage.getItem('cart'));
        if (cart === null){
            cart = [];
        }
        for (let i=0;i<cart.length;i++){
            if (id === cart[i].id){
                cart[i].count = cart[i].count + this.state.count;
                localStorage.setItem('cart',JSON.stringify(cart));
                return false;
            }
        }
        let obj = {};
        obj['id'] = id;
        obj['name'] = name;
        obj['price'] = price;
        obj['main_img_url'] = main_img_url;
        obj['count'] = this.state.count;
        obj['selectStatus'] = true;
        cart.push(obj);
        localStorage.setItem('cart',JSON.stringify(cart));
    }
    goCart(){
        this.props.history.push('/cart');
    }

    render() {
        const { main_img_url,name,price,stock,product_img,property } = this.state.data;
        const { tabs,tabselect,count,cartCount } = this.state;
        return (
            <div className="detail-container">
                <div className="top">
                    <div className="fixed-cart" onClick={()=>this.goCart()}>
                        <img src={fixedCart} alt=""/>
                        {
                            sessionStorage.getItem('userLoginToken')?(
                                <div className="fixed-cart-count" style={cartCount>0?{display:'block'}:{}}>{cartCount}</div>
                            ):(
                                <div />
                            )
                        }
                    </div>
                    <div className="top-img" style={{background: 'url('+main_img_url+') no-repeat center'}} />
                    <div className="cart-box">

                        <div className="count-box">
                            <span>数量</span>
                            <Icon type="minus" style={{margin:'-.08rem .1rem 0'}} onClick={()=>this.del()}/>
                            <span>{count}</span>
                            <Icon type="plus"  style={{margin:'-.08rem .1rem 0'}} onClick={()=>this.add()}/>
                        </div>
                        <div className="middle-border" />
                        <div className="addCart-box" onClick={()=>this.addCart()}>
                            <span>加入购物车</span>
                            <img src={Cart} alt=""/>
                        </div>
                    </div>
                    <div className="base-info-box">
                        {
                            stock>0?(
                                <div className="item stock" >有货</div>
                            ):(
                                <div className="item stock no" >缺货</div>
                            )
                        }
                        <div className="item name">{name}</div>
                        <div className="item price">￥ {price}</div>
                    </div>
                </div>
                <div style={{height:'.3rem',background:'#F9F9F9'}} />
                <div className="bottom">
                    <ul className="tabs-box">
                        {
                            tabs.map((item,key) => {
                                return (
                                    <li key={key} className={tabselect === key?'select':''} onClick={()=>this.changeTabs(key)}>{item}</li>
                                )
                            })
                        }
                    </ul>
                    <div className='product-detail-box'>
                        <div className='product-detail-imgs' style={tabselect===0?{}:{display: 'none'}}>
                            {
                                product_img===undefined?'':(
                                    product_img.map((item,key)=>{
                                        return (
                                            <img key={key} src={item.img.url} alt=""/>
                                        )
                                    })
                                )
                            }
                        </div>
                        <div className="product-detail-properties" style={tabselect===1?{}:{display: 'none'}}>
                            {
                                property === undefined?'':(
                                    property.map((item,key)=>{
                                        return (
                                            <div className='properties-item' key={key}>
                                                <div className="properties-name">{item.name}</div>
                                                <div className="properties-detail">{item.detail}</div>
                                            </div>
                                        )
                                    })
                                )
                            }
                        </div>
                        <div className='product-detail-protect' style={tabselect===2?{}:{display: 'none'}}>
                            <div>七天无理由免费退货</div>
                        </div>
                    </div>
                </div>
            </div>
        );
    }
}

export default Detail;