import React, {Component} from 'react';
import PropTypes from 'prop-types';

function PublicationTableRows(props) {
  const {references} = props;
  return references.map((ref, index) => {
    const {number, publication} = ref;
    return (
      <tr key={index}>
        <td>{number}</td>
        <td>{publication.title}</td>
        <td>{publication.maintenance_level}</td>
      </tr>
    )
  })
}

PublicationTableRows.propTypes = {
  references: PropTypes.arrayOf(PropTypes.object).isRequired
}

class PartNumberCrossReference extends Component {
  constructor(props) {
    super(props)
    this.state = {
      partNumber: "",
      references: []
    } 
    this.handlePartNumberChange = this.handlePartNumberChange.bind(this)
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  
  handlePartNumberChange(event) {
    this.setState({partNumber: event.target.value})
  }
  handleSubmit(event) {
    const {partNumber} = this.state;
    fetch(`/api/part_numbers/search?q=${encodeURI(partNumber)}`)
    .then((res) => res.json())
    .then((json) => {
      this.setState({references: json})
    })
    this.setState({partNumber: ""})
    event.preventDefault();
  }
  render() {
    const {partNumber, references} = this.state
    return (
      <div>
        <h2>Part Number Cross Reference</h2>
        <form onSubmit={this.handleSubmit}>
          <div className="form-control">
            <label>
              Part Number(s)<br></br>
              <textarea value={partNumber} onChange={this.handlePartNumberChange} />
            </label>
          </div>
          <div className="form-control">
            <input type="submit" value="Search" />
          </div>
        </form>
        { references.length > 0
          ? <table>
              <thead>
                <tr>
                  <th>Part Number</th>
                  <th>Title</th>
                  <th>Level</th>
                </tr>
              </thead>
              <tbody>
                <PublicationTableRows references={references} />
              </tbody>
              </table>
            
          : "Enter search data above, then click search."
        }
        
      </div>
    )
  }
}

export default PartNumberCrossReference;