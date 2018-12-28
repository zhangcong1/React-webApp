import React, { Component } from 'react';
import { connect } from 'react-redux';
import { actionCreators } from '../store';

class Header extends Component{
    render(){
        const { aa,changeData } = this.props;
        return (
            <div>
                <div>{aa}</div>
                <button onClick={changeData}>更改数据</button>
            </div>
        )
    }
}

const mapState = (state) => ({
    aa: state.getIn(['home','aa'])
});

const mapDispach = (dispach) => ({
    changeData(){
        dispach(actionCreators.changeData())
    }
});

export default connect(mapState,mapDispach)(Header)