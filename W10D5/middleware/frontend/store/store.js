import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import {applyMiddleware} from 'redux'

const configureStore = (preloadedState = {}) => {
  let store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

const addLoggingToDispatch = store => next => action => {
    console.log(store.getState());
    console.log(action);
    next(action);
    console.log(store.getState());
}

export default configureStore;
