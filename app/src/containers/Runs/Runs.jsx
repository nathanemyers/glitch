import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

import Run from '../../components/Run'

const Container = styled.div``

const propTypes = {
  runs: PropTypes.array.isRequired,
  createRun: PropTypes.func.isRequired,
}

export default function Runs(props) {
  const runs = props.runs.map(run => (
    <Run 
      key={run.name}
      name={run.name}
    />
  ))
  return (
    <Container>
      <h1>Runs</h1>
      {runs}
    </Container>
  )
}

Runs.propTypes = propTypes
