import React, {Component} from 'react'

class UserInfo extends Component {
  constructor(props) {
    super(props)
    this.state = {
      currentUser: props.currentUser
    }
  }
  render() {
    return (
      <div>
        <h2>Current User Information</h2>
        <h3>Default Library</h3>
        <p>just whatever for now. stop asking.</p>
      </div>
    )
  }
}

export default UserInfo