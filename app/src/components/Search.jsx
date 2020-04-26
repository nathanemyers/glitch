import React, { useState } from 'react'
import PropTypes from 'prop-types'
import styled from 'styled-components'

const Container = styled.div``

const SearchLabel = styled.label``

const Input = styled.input``

const SubmitButton = styled.button``

const propTypes = {
  className: PropTypes.string,
  onSubmit: PropTypes.func.isRequired,
}

export default function Home(props) {
  const [ search, setSearch ] = useState("")

  return (
    <Container className={props.className}>
      <SearchLabel>
        Image Search
        <Input 
          type="text" 
          name="search" 
          value={search} 
          onChange={e => setSearch(e.target.value)}
        />
      </SearchLabel>

      <SubmitButton onClick={() => props.onSubmit(search)}>SEARCH</SubmitButton> 
    </Container>
  )
}

Home.propTypes = propTypes
