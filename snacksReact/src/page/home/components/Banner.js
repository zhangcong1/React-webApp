import React,{ Component } from 'react';
import { connect } from 'react-redux';
import { actionCreators } from '../store';

import Swiper from 'swiper/dist/js/swiper.min';
import 'swiper/dist/css/swiper.min.css';
import '../style.scss';

class Banner extends Component{
    constructor(props){
        super(props);
        this.goDetail = this.goDetail.bind(this);
    }
    goDetail(id){
        this.props.router.push('/product/'+id);
    }
    render(){
        const { banner_list } = this.props;
        return (
            <div className='swiper-container'>
                <ul className='swiper-wrapper'>
                    {
                        banner_list.map((item) => {
                            return (
                                <li className='swiper-slide' key={item.id} onClick={()=>this.goDetail(item.key_word)}>
                                    <img src={item.img.url} alt=""/>
                                </li>
                            )
                        })
                    }
                </ul>
                <div className="swiper-pagination" />
            </div>
        )
    }
    componentDidMount(){
        this.props.getBanner(function () {
            new Swiper('.swiper-container',{
                autoplay: true,
                delay: 3000,
                loop: true,
                pagination: {
                    el: '.swiper-pagination',
                    type: 'bullets',
                    clickable: true
                }
            });
        });
    }
}

const mapState = (state) => ({
    banner_list: state.getIn(['home','banner_list'])
});

const mapDispach = (dispach) => ({
    getBanner(callback){
        dispach(actionCreators.getBanner(callback))
    }
});

export default connect(mapState,mapDispach)(Banner)