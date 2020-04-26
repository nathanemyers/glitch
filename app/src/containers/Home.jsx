import React, { useState } from 'react'
//import PropTypes from 'prop-types'
import styled from 'styled-components'

import {
  getRandomImage,
} from '../services/usplash'

import Search from '../components/Search'
import Image from '../components/Image'

const Container = styled.div``

const StyledImage = styled(Image)`
  width: 400px;
  height: 400px;
`

const propTypes = {

}

export default function Home(props) {
  const [ desc, setDesc ] = useState("")
  const [ url, setURL ] = useState(null)

  async function handleSubmit(search) {
    const { url, description } = await getRandomImage({
      query: search,
      orientation: 'squarish',
    })
    setDesc(description)
    setURL(url)
  }

  return (
    <Container>
      <h1>Home</h1>

      <Search onSubmit={handleSubmit} />
      <StyledImage 
        url={url}
        description={desc}
      />

    </Container>
  )
}

Home.propTypes = propTypes
