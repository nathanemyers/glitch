import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

import DropUpload from '../../components/DropUpload'

const Container = styled.div``

const propTypes = {
  onUpload: PropTypes.func.isRequired,
}

export default function Runs(props) {
  return (
    <Container>
      <DropUpload 
        onUpload={props.onUpload}
      />
    </Container>
  )
}

Runs.propTypes = propTypes
