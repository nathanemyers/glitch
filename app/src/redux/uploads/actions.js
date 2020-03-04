import {
  postUpload,
} from '../../services/server'

export const UPLOAD_IMAGE_START = 'UPLOAD_IMAGE_START'
export function uploadImageStart() {
  return {
    type: UPLOAD_IMAGE_START
  }
}

export const UPLOAD_IMAGE_SUCCESS = 'UPLOAD_IMAGE_SUCCESS'
export function uploadImageSuccess(id) {
  return {
    type: UPLOAD_IMAGE_SUCCESS,
    id,
  }
}

export const UPLOAD_IMAGE_FAIL = 'UPLOAD_IMAGE_FAIL'
export function uploadImageFail(error) {
  return {
    type: UPLOAD_IMAGE_FAIL,
    error,
  }
}

export function uploadImage(file) {
  return async (dispatch) => {
    dispatch(uploadImageStart())
    try {
      const id = await postUpload(file)
      dispatch(uploadImageSuccess(id))
    } catch(e) {
      dispatch(uploadImageFail(e.message))
    }
  }
}

