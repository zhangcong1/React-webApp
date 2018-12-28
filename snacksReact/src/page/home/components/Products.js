import React,{ Component } from 'react';
import '../style.scss';

class Products extends Component{
    constructor(props){
        super(props);
        this.goDetail = this.goDetail.bind(this);
    }
    goDetail(id){
        this.props.router.push('/product/'+id);
    }
    render(){
        const { data } = this.props;
        return (
            <ul className='product-box'>
                {
                    data.map((item) => {
                        return (
                            <li key={item.id} onClick={()=>this.goDetail(item.id)}>
                                <div className='img' style={{background: 'url('+item.main_img_url+') no-repeat center'}}>
                                </div>
                                <h4>{item.name}</h4>
                                <h5>￥{item.price}</h5>
                            </li>
                        )
                    })
                }
            </ul>
        )
    }
}

export default Products;