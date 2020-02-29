import React from 'react'

import Home from './containers/Home'

const runs = [
  { name: 'foo' },
  { name: 'bar' },
  { name: 'baz' },
]

function App() {
  return (
    <Home
      runs={runs}
    />
  )
}

export default App
