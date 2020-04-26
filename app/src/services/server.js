import {
  RUNS_URL,
  UPLOAD_URL,
} from './constants'

const settings = {
  mode: 'cors', // no-cors, *cors, same-origin
  cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
  credentials: 'same-origin', // include, *same-origin, omit
  headers: {
    'Content-Type': 'application/json'
    // 'Content-Type': 'application/x-www-form-urlencoded',
  },
  origin: "*",
  redirect: 'follow', // manual, *follow, error
  referrerPolicy: 'no-referrer', // no-referrer, *client
}

export async function getRuns() {
  const response = await fetch(RUNS_URL, {
    ...settings,
    method: 'GET',
  })

  const data = await response.json()
  return data.runs
}

export async function postRuns(data={}) {
  const response = await fetch(RUNS_URL, {
    ...settings,
    method: 'POST',
    body: JSON.stringify(data) // body data type must match "Content-Type" header
  })

  return await response.json()
}

export async function postUpload({ file }) {
  const formData = new FormData()
  formData.append('file', file)

  const response = await fetch(UPLOAD_URL, {
    ...settings,
    method: 'POST',
    headers: {
      'Content-Type': 'multipart/form-data'
    },
    body: formData,
  })

  return await response.json()
}
