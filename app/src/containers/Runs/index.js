import { connect } from 'react-redux'
import { 
  fetchRuns, 
  createRun,
} from '../../redux/runs/actions'

import {
  getRuns,
} from '../../redux/runs/selectors'

import Runs from './Runs'


export default connect(
  (state) => ({
    runs: getRuns(state)      
  }),
  (dispatch) => ({
    fetchRuns: () => dispatch(fetchRuns()),
    createRun: () => dispatch(createRun()),
  }),
)(Runs)
