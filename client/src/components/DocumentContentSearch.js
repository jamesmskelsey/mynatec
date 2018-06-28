import React, {Component} from 'react';

class DCSPublication extends Component {
  state = {
    collapsed: true,
  }
  render() {
    const {pub, excerpts} = this.props;
    const {collapsed} = this.state;
    return (
      <li key={pub} onClick={() => this.setState({collapsed: !collapsed})}>{pub} 
        { collapsed 
          ? null
          : <ul>
            {excerpts.length 
              ? excerpts.slice(0,10).map((e, idx) => {
                return (
                  <li key={idx}>{e.text}</li>
                )
              })
              : "Probably an error."
            }
          </ul>
        }
      </li>
    )
  }
}

class DCSResults extends Component {
  render() {
    const {excerpts} = this.props;
    let excerptKeys = Object.keys(excerpts)|| []
    return (
      <ul>
        {excerptKeys.length
          ? excerptKeys.map((pub) => {
            return (
              <DCSPublication key={pub} pub={pub} excerpts={excerpts[pub]}/>
            )
          })
          : "Loading..."}
      </ul>
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
          <label>Search for...</label>
          <input type="text" value={searchTerm} onChange={(e) => this.onSearchTermChange(e)} />
          <label>Match case exactly</label>
          <input type="checkbox" value={matchCase} onClick={() => this.onMatchCaseClick()} />
          <button onClick={() => this.performSearch(searchTerm, matchCase)}>Search</button>
        </form>
        <DCSResults excerpts={excerpts} />
      </div>
    )
  }
}

export default DocumentContentSearch;