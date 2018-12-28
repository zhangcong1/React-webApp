import React,{ Component } from 'react';
import '../style.scss';

class Catedetail extends Component{
    constructor(props){
        super(props);
        this.goDetail = this.goDetail.bind(this);
    }
    goDetail(id){
        this.props.router.push('/product/'+id);
    }
    render() {
        const { cateproductInfo } = this.props;
        return (
            <div className='transition'>
                <div className="category-head" style={{background:'url('+cateproductInfo.topImgUrl+') no-repeat center'}}>
                </div>
                <div className="category-title">
                    <span>{cateproductInfo.title}</span>
                </div>
                <ul className="category-main">
                    {
                        cateproductInfo.products.map((item) => {
                            return (
                                <li key={item.id} onClick={()=>this.goDetail(item.id)}>
                                    <div className='img-box' style={{background: 'url('+item.main_img_url+') no-repeat center'}}>
                                    </div>
                                    <h5>{item.name}</h5>
                                </li>
                            )
                        })
                    }
                </ul>
            </div>
        );
    }
}

export default Catedetail;