//entry file

import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import {fetchSearchGiphys} from './util/api_util';
import {configureStore} from './store/store';
import { receiveSearchGiphys, requestSearchGiphys } from './actions/giphy_actions';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = {};
  const store = configureStore();
  const root = document.getElementById('root');
  window.fetchSearchGiphys = fetchSearchGiphys;
  window.receiveSearchGiphys = receiveSearchGiphys;
  window.store = store;
  //ReactDOM.render(<Root store={store} />, root);
});
