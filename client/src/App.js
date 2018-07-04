import React, { Component } from 'react';
import {BrowserRouter as Router, Route, Switch, Link} from 'react-router-dom';
import Home from './components/Home.js'
import UserInfo from './components/UserInfo.js'
import DocumentContentSearch from './components/DocumentContentSearch.js'
import PartNumberCrossReference from './components/PartNumberCrossReference.js'
import Elms from './components/Elms.js'
import NotFound from './components/NotFound.js'
import './App.css';
// This is TOTALLY FAKE AUTHENTICATION
import currentUser from './auth.js'


class App extends Component {
  getAuthedUser() {
    return currentUser.get_auth_info()
  }
  render() {
    const currentUser = this.getAuthedUser()
    const userName = currentUser.fullUserName()
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <h1><Link to="/">myNATEC Home Page</Link></h1>
            <p>You are logged in as <Link to="user_info">{userName}</Link></p>
          </header>
          <div className="container">
            <Switch>
              <Route exact path="/" component={Home} />
              <Route path="/user_info" component={UserInfo} />
              <Route path="/document_content_search" component={DocumentContentSearch} />
              <Route path="/part_number_cross" component={PartNumberCrossReference} />
              <Route path="/elms" render={(props) => <Elms {...props} currentUser={currentUser} /> } />
              <Route component={NotFound} />
            </Switch>
          </div>
        </div>
      </Router>
    );
  }
}

export default App;
