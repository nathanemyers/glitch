import React from 'react'
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom"

import Nav from './components/Nav'
import NavItem from './components/NavItem'

import Home from './containers/Home'
import Runs from './containers/Runs'

function App() {
  return (
    <Router>
      <div>
        <nav>
          <Nav>
            <NavItem>
              <Link to="/">Home</Link>
            </NavItem>
            <NavItem>
              <Link to="/runs">Runs</Link>
            </NavItem>
          </Nav>
        </nav>

        <Switch>
          <Route path="/runs">
            <Runs />
          </Route>
          <Route path="/">
            <Home />
          </Route>
        </Switch>
      </div>
    </Router>
  )
}

export default App
