import { applyMiddleware, createStore, compose, combineReducers } from 'redux'
import thunkMiddleware from 'redux-thunk'
import loggerMiddleware from './middleware/logger'

import runs from './runs/reducer'

const rootReducer = combineReducers({
  runs,
})

const middleware = applyMiddleware(loggerMiddleware, thunkMiddleware)
const composedEnhancers = compose(
  middleware,
)

const store = createStore(rootReducer, undefined, composedEnhancers)

export default store
