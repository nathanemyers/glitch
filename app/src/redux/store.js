import { applyMiddleware, createStore, compose, combineReducers } from 'redux'
import thunk from 'redux-thunk'
import logger from 'redux-logger'

import runs from './runs/reducer'

const rootReducer = combineReducers({
  runs,
})

const middleware = applyMiddleware(thunk, logger)
const composedEnhancers = compose(
  middleware,
)

const store = createStore(rootReducer, undefined, composedEnhancers)

export default store
