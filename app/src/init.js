import store from './redux/store'

import {
  fetchRuns
} from './redux/runs/actions'

export default function init() {
  store.dispatch(fetchRuns())
}
