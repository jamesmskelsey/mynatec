import React, { Component } from 'react';
import {Link} from 'react-router-dom';

class Home extends Component {
  render() {
    return (
      <div>
        <h2>Table of Contents</h2>
        <ul>
          <li><Link to="/document_content_search">Document Content Search</Link></li>
          <li><Link to="/part_number_cross">Part Number Cross Reference</Link></li>
          <li><Link to="/elms">Enhanced Library Management System (ELMS)</Link></li>
        </ul>
      </div>
    )
    
  }
}

export default Home;