import React from 'react';
import ReactDOM from 'react-dom';
import GiphysIndex from './components/giphys_index';
import configureStore from './store/store'
// import {fetchSearchGiphys} from '../util/api_util'
import {receiveSearchGiphys, fetchSearchGiphys} from './actions/giphy_actions'
import Root from './components/root'

document.addEventListener('DOMContentLoaded', () => {
    const root = document.getElementById('root')
    const store = configureStore();
    ReactDOM.render(<Root store={store}/>, root)

    //TODO REMOVE
    window.store = store;
    window.fetchSearchGiphys = fetchSearchGiphys;
    window.receiveSearchGiphys = receiveSearchGiphys;
})