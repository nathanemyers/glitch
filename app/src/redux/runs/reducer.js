import {
  FETCH_RUNS_START,
  FETCH_RUNS_FAIL,
  FETCH_RUNS_SUCCESS,
} from './actions'

const initialState = {
  runs: [],
  loading: false,
  error: null,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case FETCH_RUNS_START:
      return {
        ...state,
        loading: true,
      }
    case FETCH_RUNS_SUCCESS:
      return {
        ...state,
        runs: action.runs,
      }
    case FETCH_RUNS_FAIL:
      return {
        ...state,
        error: action.error,
      }
    default:
      return state
  }
}
