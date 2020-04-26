import { USPLASH_RANDOM_IMAGE } from './constants'

const settings = {
  mode: 'cors', // no-cors, *cors, same-origin
  cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
  credentials: 'same-origin', // include, *same-origin, omit
  headers: {
    'Content-Type': 'application/json'
  },
  origin: "*",
  redirect: 'follow', // manual, *follow, error
  referrerPolicy: 'no-referrer', // no-referrer, *client
}

export async function getRandomImage(options) {
  const url = new URL(USPLASH_RANDOM_IMAGE)

  console.log('process env', process.env)

  const params = {
    client_id: process.env.REACT_APP_USPLASH_ACCEESS_KEY, 
    ...options,
  }

  Object.keys(params).forEach(key => url.searchParams.append(key, params[key]))

  const response = await fetch(url , {
    ...settings,
    method: 'GET',
  })

  const data = await response.json()

  return {
    description: data.description,
    url: data.urls.regular,
  }
}
