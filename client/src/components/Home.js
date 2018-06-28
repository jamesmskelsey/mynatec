import React, { Component } from 'react';
import {Link} from 'react-router-dom';

class Home extends Component {
  render() {
    return (
      <div>
      <Link to="/document_content_search">Document Content Search</Link>
      <Link to="/part_number_cross">Part Number Cross Reference</Link>
    </div>
    )
    
  }
}

export default Home;