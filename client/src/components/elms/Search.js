import React, {Component} from 'react'
import currentUser from '../../auth.js'

class Search extends Component {
  constructor(props) {
    super(props)
    this.state = {
      searchResults: []
    }
  }
  handleSubmit(event) {
    event.preventDefault()
    const formData = new FormData(event.target)
    
    fetch(`/api/library/${currentUser.auth_info.defaultLibrary}/entries/search`, {
      method: 'POST',
      body: formData
    })
    .then((response) => response.json())
    .then((json) => {
      this.setState({searchResults: json})
      console.log(json)
    })
  }
  clearSearchResults() {
    this.setState({searchResults: []})
  }
  render() {
    const {searchResults} = this.state;
    
      { return searchResults.length === 0 
      ? 
      <form onSubmit={(event) => this.handleSubmit(event)}>
        <div className="row">
          <div className="col">
            <div className="form-control">
              <label>Publication Number</label>
              <input name="pub_number" type="text" ref={input => this.publicationNumber = input} />
            </div>
            <div className="form-control">
              <label>Copy Number</label>
              <input name="copy_number" type="text" ref={input => this.copyNumber = input} />
            </div>
            <div className="form-control">
              <label>Publication Type</label>
              <select name="pub_type[]" defaultValue={[]} multiple ref={pub_type => {this.publicationType = pub_type}} >
                <option value="E">E</option>
                <option value="C">C</option>
              </select>
            </div>
            <div className="form-control">
              <label>Work Center(s)</label>
              <select name="work_center[]" defaultValue={[]} multiple ref={wc => {this.workCenter = wc}}>
                <option value="610">610</option>
                <option value="650">650</option>
                <option value="710">710</option>
              </select>
            </div>
          </div>
          <div className="col">
            <div className="form-control">
              <input type="submit" value="search" />
            </div>
          </div>
        </div>
      </form> 
      : 
      <div className="col">
        <button onClick={() => this.clearSearchResults()}>New Search</button>
        <table>
          <thead>
            <tr>
              <td>Number</td>
              <td>Copy #</td>
              <td>Type</td>
              <td>Title</td>
              <td>Date Issued</td>
              <td>Last Audited</td>
            </tr>
          </thead>
          <tbody>
            {searchResults.map((pub, i) => {
              return (
                <tr key={i}>
                  <td>{pub.pub_number}</td>
                  <td>{pub.copy_number}</td>
                  <td>{pub.pub_type}</td>
                  <td>{pub.title}</td>
                  <td>{pub.issue_date}</td>
                  <td>{pub.last_audit_date}</td>
                </tr>
              )
            })}
          </tbody>
        </table>      
      </div> 
    }

        
      
    
  }
}

export default Search;