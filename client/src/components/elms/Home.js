import React, {Component} from 'react'

function LibraryDetails(props) {
  const {account, maintenance_level, uic, activity, poc_name, poc_phone, poc_email,
          lead_ctpl, alt_ctpl, qa_monitor} = props.details;
          console.log(props)
  return (
    <div className="row">
      <div className="col">
        <h3>{uic} : {activity}</h3>
        <p>Account Code: {account}</p>
        <p>Maintenance Level: {maintenance_level}</p>
      </div>
      <div className="col">
        <h3>Point of Contact</h3>
        <address>
          {poc_name}<br></br>
          {poc_phone}<br></br>
          {poc_email}<br></br>
        </address>
        <p>Lead: {lead_ctpl} &nbsp;&ndash;&nbsp; 
        Alt: {alt_ctpl} &nbsp;&ndash;&nbsp;
        Monitor: {qa_monitor} 
        </p>
      </div>
    </div>
  )
}

class Home extends Component {
  constructor(props) {
    super(props)
    this.state = {
      library: props.library,
      libraryDetails: {}
    }
  }
  componentDidMount() {
    const {library} = this.state;
    fetch(`http://localhost:3000/api/library/${library}`)
    .then((response) => response.json())
    .then((json) => {
      
      this.setState({libraryDetails: json})
    })
    .catch((res) => {console.error(res)})
    
  }
  render() {
    const {libraryDetails} = this.state
    return (
      <div>
        {libraryDetails.account
        ? <LibraryDetails details={libraryDetails} />
        : "Please wait while we load a library."
        }
      </div>
    )
  }
}

export default Home;