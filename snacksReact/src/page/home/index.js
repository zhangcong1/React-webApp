import React,{ Component,Fragment } from 'react';
import { connect } from 'react-redux';
import { actionCreators } from './store';

import Banner from './components/Banner';
import Title from './components/Title';
import Theme from './components/Theme';
import Products from './components/Products';
import Tab from '../tab';

class Home extends Component{
    render(){
        const { product_list } = this.props;
        return (
            <Fragment>
                <Banner router={this.props.history} />
                <Title>精选主题</Title>
                <Theme  router={this.props.history} />
                <Title>最近新品</Title>
                <Products router={this.props.history} data={product_list}/>
                <Tab path='/' />
            </Fragment>
        )
    }
    componentDidMount(){
        this.props.getProduct();
    }
}
const mapState = (state) => ({
    product_list: state.getIn(['home','product_list'])
});
const mapDispach = (dispach) => ({
    getProduct(){
        dispach(actionCreators.getProduct())
    }
});
export default connect(mapState,mapDispach)(Home);