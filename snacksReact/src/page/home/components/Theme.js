import React,{ Component } from 'react';
import { connect } from 'react-redux';
import { actionCreators } from '../store';

import '../style.scss';

class Theme extends Component{
    constructor(props){
        super(props);
        this.goTheme = this.goTheme.bind(this);
    }
    goTheme(id){
        this.props.router.push('/theme/'+id);
    }
    render(){
        const { theme_list } = this.props;
        return (
            <div className="Theme-box">
                {
                    theme_list.map((item) => {
                        return (
                            <div className='theme-item' key={item.id} onClick={()=>this.goTheme(item.id)}>
                                <img src={item.topic_img.url} alt=""/>
                            </div>
                        )
                    })
                }
            </div>
        )
    }
    componentDidMount(){
        this.props.getTheme();
    }
}

const mapState = (state) => ({
    theme_list: state.getIn(['home','theme_list'])
});

const mapDispach = (dispach) => ({
    getTheme(){
        dispach(actionCreators.getTheme())
    }
})

export default connect(mapState,mapDispach)(Theme)