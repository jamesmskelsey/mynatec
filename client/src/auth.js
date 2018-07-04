// Do you like my super hacky FakeAuth class? This will allow me store some "default library"
// information about the "user". Don't mind me...
class FakeAuth {
  constructor(rate, userName, defaultLibrary) {
    this.auth_info = {
      loggedIn: true,
      rate,
      userName,
      defaultLibrary
    }
  }
  get_auth_info() {
    return {
      ...this.auth_info,
      fullUserName() {
        return `${this.rate} ${this.userName}`
      }
    }
  }
}

const currentUser = new FakeAuth("AT1", "FakeAuth, Totally", 1)

export default currentUser