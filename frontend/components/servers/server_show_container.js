import React from 'react';
import { connect } from 'react-redux';
import ServerShow from './server_show'
import { logout } from '../../actions/session_actions'
import { openModal, closeModal } from '../../actions/modal_actions';
import { faCog, faPlus } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { fetchServers } from "../../actions/server_actions"
const msp = (state) => ({
  
  currentUser: state.session.currentUser
});

const mdp = dispatch => ({
  logout: () => dispatch(logout()),
  closeModal: () => dispatch(closeModal()),
  openSettings: <button className="settings-icon" onClick={() => dispatch(openModal('settings'))}>
    <FontAwesomeIcon icon={faCog} />
      </button>,
  openCreateServer: <button className="modal-button-icon" onClick={() => dispatch(openModal('createServer'))}>
    <FontAwesomeIcon icon={faPlus} />
  </button>,
  openServerModal: () => dispatch(openModal("createServer")),
  openModal: modalType => dispatch(openModal(modalType)),
  fetchServers: () => dispatch(fetchServers())
      
});

export default connect(msp, mdp)(ServerShow);