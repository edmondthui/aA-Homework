import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS'
export const REQUEST_SEARCH_GIPHYS = 'REQUEST_SEARCH_GIPHYS';

export const receiveSearchGiphys = (giphys) => {
    return {
        type: RECEIVE_SEARCH_GIPHYS,
        giphys
    }
}

export const fetchSearchGiphys = (search) => {
    return (dispatch) => {
        return APIUtil.fetchSearchGiphys(search).then(response => {
            dispatch(receiveSearchGiphys(response.data));
        })
    }
}