import { RECEIVE_SEARCH_GIPHYS } from '../actions/giphy_actions';


export const GiphysReducer = (state = [], action) => {
  let nextState;
  switch (action.type) {
    case RECEIVE_SEARCH_GIPHYS:
      nextState = [...state, action.giphys];
      return nextState;
    default:
      return state;
  }
};
