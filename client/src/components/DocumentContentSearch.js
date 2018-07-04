import React, {Component} from 'react';

class DCSPublication extends Component {
  state = {
    collapsed: true,
  }
  render() {
    const {pub, excerpts} = this.props;
    const {collapsed} = this.state;
    return (
      
      <tr key={pub} >
        <td>{pub}</td>
        <td onClick={() => {this.setState({collapsed: !collapsed}); console.log(this.state)}}>{excerpts.length && !this.state.collapsed
              ? excerpts.map((e, idx) => {
                return (
                  <ul key={idx}>
                    <li>{e.page_number}
                    ...{e.text}...</li>
                  </ul>
                )
              })
              : `${excerpts.length} instances found.`
            }

        </td>
      </tr>
    )
  }
}

class DCSResults extends Component {
  render() {
    const {excerpts} = this.props;
    let excerptKeys = Object.keys(excerpts)|| []
    return (
      <div>
        {excerptKeys.length
            ?
            <div>
              <h3>Results: </h3>
              <table>
                <thead>
                  <tr>
                    <th>Pub Number</th>
                    <th>Excerpts</th>
                  </tr>
                </thead>
                <tbody>
                { excerptKeys.map((pub) => {
                    return (
                      <DCSPublication key={pub} pub={pub} excerpts={excerpts[pub]}/>
                    )
                  })
                }
                </tbody>
              </table>
            </div>
            : "Enter search criteria above."
          }
      </div>
    );
  }
}

class DocumentContentSearch extends Component {
  state = {
    excerpts: {},
    searchTerm: "",
    matchCase: false
  }
  performSearch(query, matchCase) {
    fetch(`/api/excerpts/search?q=${query}&matchcase=${matchCase}`)
    .then((res) => res.json())
    .then((json) => {
      console.log(json)
      this.setState({excerpts: json})
    })
  }
  onSearchTermChange(e) {
    this.setState({searchTerm: e.target.value})
  }
  onMatchCaseClick() {
    this.setState({matchCase: !this.state.matchCase})
  }
  render() {
    const {excerpts, searchTerm, matchCase} = this.state
    return (
      <div>
        <form onSubmit={(e) => e.preventDefault()}>
          <fieldset>
            <legend>Search all documents for...</legend>
            <div className="form-control">

              <label>Search for...</label>
              <input type="text" value={searchTerm} onChange={(e) => this.onSearchTermChange(e)} />
            </div>
            <div className="form-control">
              <label>Match case exactly</label>
              <input type="checkbox" value={matchCase} onClick={() => this.onMatchCaseClick()} />
            </div>
          </fieldset>
          <div className="form-control">
            <button onClick={() => this.performSearch(searchTerm, matchCase)}>Search</button>
          </div>
        </form>
        <DCSResults excerpts={excerpts} />
      </div>
    )
  }
}

export default DocumentContentSearch;