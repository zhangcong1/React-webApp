import React,{ Component,Fragment } from 'react';
import { Provider } from 'react-redux';
import store from './store';
import Home from './page/home';
import Category from './page/category';
import Cart from './page/cart';
import Login from './page/login';
import { Route,HashRouter } from 'react-router-dom';
import My from "./page/my";
import Detail from "./page/detail";
import Theme from "./page/theme";
import Order from "./page/order";
import Address from "./page/address";
import Pay from "./page/pay";

class App extends Component{
    render(){
        return (
            <Provider store={store}>
                <Fragment>
                    <HashRouter>
                        <div style={{background: 'white'}}>
                            <Route path='/' exact component={Home} />
                            <Route path='/category' exact component={Category} />
                            <Route path='/cart' exact component={Cart} />
                            <Route path='/my' exact component={My} />
                            <Route path='/login' exact component={Login} />
                            <Route path='/product/:id' exact component={Detail} />
                            <Route path='/theme/:id' exact component={Theme} />
                            <Route path='/order' exact component={Order} />
                            <Route path='/address' exact component={Address} />
                            <Route path='/pay/:id' exact component={Pay} />
                        </div>
                    </HashRouter>
                </Fragment>
            </Provider>
        )
    }
}

export default App;