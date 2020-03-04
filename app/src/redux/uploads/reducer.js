import {
  UPLOAD_IMAGE_START,
  UPLOAD_IMAGE_SUCCESS,
  UPLOAD_IMAGE_FAIL,
} from './actions'

const initialState = {
  data: [],
  loading: false,
  error: null,
}

export default (state = initialState, action) => {
  switch (action.type) {
    case UPLOAD_IMAGE_START:
      return {
        ...state,
        loading: true,
      }
    case UPLOAD_IMAGE_SUCCESS:
      return {
        ...state,
        runs: action.runs,
      }
    case UPLOAD_IMAGE_FAIL:
      return {
        ...state,
        error: action.error,
      }
    default:
      return state
  }
}
