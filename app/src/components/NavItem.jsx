import styled from 'styled-components'

export default styled.li`
  color: ${({ theme }) => theme.priaryDark};
  padding: 0.25em 1em;

  a {
    text-decoration: none;
  }
`
