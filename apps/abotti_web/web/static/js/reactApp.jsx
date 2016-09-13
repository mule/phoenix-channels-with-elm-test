import React from 'react';
import { render } from 'react-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';
import helloReducer from './reactApp/reducers';
import App from './reactApp/components/App';

let store = createStore(helloReducer);

render(
        <Provider store={store}>
        <App />
        </Provider>,
    document.getElementById('root')
);
