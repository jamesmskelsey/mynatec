import React, { Component } from 'react';
import {BrowserRouter as Router, Route} from 'react-router-dom';
import Home from './components/Home.js'
import DocumentContentSearch from './components/DocumentContentSearch.js'
import PartNumberCrossReference from './components/PartNumberCrossReference.js'
import './App.css';

class App extends Component {
  render() {
    return (
      <Router>
        <div className="App">
          <header className="App-header">
            <h1>Playing with data</h1>
          </header>
          
            <Route exact path="/" component={PartNumberCrossReference} />
            <Route path="/document_content_search" component={DocumentContentSearch} />
            <Route path="/part_number_cross" component={PartNumberCrossReference} />
          
        </div>
      </Router>
    );
  }
}

export default App;
