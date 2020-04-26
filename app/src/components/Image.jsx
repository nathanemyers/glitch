import React from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

const Container = styled.div``

const Img  = styled.img``

const Description = styled.div``

const propTypes = {
  className: PropTypes.string,
  url: PropTypes.string.isRequired,
  description: PropTypes.string,
}

export default function Image(props) {
  return (
    <Container className={props.className}>
      <Img src={props.url} />

      <Description>{props.description || "No Description"}</Description>
    </Container>
  )
}

Image.propTypes = propTypes
