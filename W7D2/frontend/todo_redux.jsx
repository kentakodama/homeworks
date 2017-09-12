import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

//splitting the dispatch into parts so that each step can be logged
//this is a type of middleware, not recommended to use it.
const addLoggingToDispatch = store => {
  let dispatch = store.dispatch;
  return (action) => {
    console.log('Action received:' , action);
    console.log(store.getState());
    let result = dispatch(action);
    console.log(store.getState());
    return result;
  };
};


document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  store.dispatch = addLoggingToDispatch(store);
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
