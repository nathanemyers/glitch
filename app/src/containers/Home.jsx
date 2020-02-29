import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

import Run from '../components/Run'

const Container = styled.div``

const propTypes = {
  runs: PropTypes.array.isRequired
}

export default function Home(props) {
  const runs = props.runs.map(run => (
    <Run 
      key={run.name}
      name={run.name}
    />
  ))
  return (
    <Container>
      {runs}
    </Container>
  )
}

Home.propTypes = propTypes
