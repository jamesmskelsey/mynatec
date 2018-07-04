import React, {Component} from 'react';
import {Route, Link} from 'react-router-dom';
import Home from './elms/Home.js'
import Search from './elms/Search'

class Elms extends Component {
  constructor(props) {
    super(props)
    this.state = {
      currentUser: props.currentUser
    }
  }
  render() {
    console.log(this.props)
    const {currentUser} = this.state
    const {defaultLibrary} = currentUser
    const {match} = this.props
    return (
      <div>
        <h2><Link to="/elms/">ELMS</Link> for Library: {defaultLibrary}</h2>
        <ul>
          <li><Link to={`${match.path}/library_search`}>Library Search</Link></li>
          <li><Link to="elms/">Library Audit</Link></li>
          <li><Link to="elms/">ADRL</Link></li>
        </ul>
        <Route exact path={`${match.path}/`} render={(props) => <Home {...props} library={defaultLibrary}  />} />
        <Route path={`${match.path}/library_search`} component={Search} />
      </div>
    )
    
  }
}

export default Elms