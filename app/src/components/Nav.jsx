import styled from 'styled-components'

export default styled.ul`
  display: flex;
  flex-direction: row;
  background-color: ${({ theme }) => theme.primary};
  color: ${({ theme }) => theme.priaryDark};
  list-style-type: none;
  padding: 0;
  margin-top: 0;
`
