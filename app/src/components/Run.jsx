import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

const Container = styled.div``

const propTypes = {
  name: PropTypes.string.isRequired,
}

export default function Run(props) {
  return (
    <Container>
      { props.name }
    </Container>
  )
}

Run.propTypes = propTypes
