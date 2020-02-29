import {
  getRuns,
  postRuns,
} from '../../services/server'

export const FETCH_RUNS_START = 'FETCH_RUNS_START'
export function fetchRunsStart() {
  return {
    type: FETCH_RUNS_START
  }
}

export const FETCH_RUNS_SUCCESS = 'FETCH_RUNS_SUCCESS'
export function fetchRunsSuccess(runs) {
  return {
    type: FETCH_RUNS_SUCCESS,
    runs,
  }
}

export const FETCH_RUNS_FAIL = 'FETCH_RUNS_FAIL'
export function fetchRunsFail(error) {
  return {
    type: FETCH_RUNS_FAIL,
    error,
  }
}

export function fetchRuns() {
  return async (dispatch) => {
    dispatch(fetchRunsStart)
    try {
      const runs = await getRuns()
      dispatch(fetchRunsSuccess(runs))
    } catch(e) {
      dispatch(fetchRunsFail(e))
    }
  }
}

export function createRun() {
  return async (dispatch) => {
    try {
      await postRuns()
      dispatch(fetchRuns())
    } catch(e) {
      console.error(`error posting run`, e)
    }
  }
}
