import { connect } from 'react-redux'

import Uploads from './Uploads'

import {
  uploadImage,
} from '../../redux/uploads/actions'

export default connect(
  (state) => ({
  }),
  (dispatch) => ({
    onUpload: (file) => dispatch(uploadImage(file))
  }),
)(Uploads)
