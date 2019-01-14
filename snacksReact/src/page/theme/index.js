import React,{Component} from 'react';
import './style.scss';
import Products from '../home/components/Products';
import * as constantsURL from '../../store/constants';

class Theme extends Component{
    constructor(props){
        super(props);
        this.state = {
            data: {
                head_img: '',
                products: []
            }
        }
    }
    componentWillMount() {
        let id = this.props.match.params.id;
        fetch(constantsURL.PRE_URL+'/api/v1/theme/'+id).then((e)=>{
            return e.json();
        }).then((e)=>{
            this.setState({
                data: e
            })
        })
    }

    render() {
        const { head_img,products } = this.state.data;
        return (
            <div className='theme-container'>
                <div className="head">
                    <img src={head_img.url} alt=""/>
                </div>
                <Products router={this.props.history} data={products}/>
            </div>
        );
    }
}

export default Theme;