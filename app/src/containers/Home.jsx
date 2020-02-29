import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

const Container = styled.div``

const propTypes = {
  runs: PropTypes.array.isRequired
}

export default function Home(props) {
  return (
    <Container>
      <h1>Home</h1>
    </Container>
  )
}

Home.propTypes = propTypes
