import React from "react";
import { withRouter, Redirect } from 'react-router-dom'
import UserIndexItem from './user_index_item'


class UsersIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchUsers()
  }

  render() {
    console.log(this.props.users)
    const userList = Object.values(this.props.users).map(user => (
      <li key={`user-${user.id}`}>
        <UserIndexItem user={user} />
      </li>
    ))

    console.log(userList)
    return (
      <div>{userList}</div>
    )

  }
}

export default withRouter(UsersIndex);