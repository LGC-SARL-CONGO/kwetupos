import React from 'react';
import { useNavigate } from 'react-router-dom';

import { useAuth } from '../../../services/useAuth';

import { Dropdown, DropdownContent, DropdownItem } from '../../BaseUI/Dropdown';

import { MdKeyboardArrowDown } from "react-icons/md";

import './style.scss';
import Avatar from '../Avatar';

export default function UserDropdown({ user, hideName}) {
    const navigate = useNavigate()

    const {logout} = useAuth()

    const sigout = () => {
        if (logout()) navigate('/login', {replace: true})
    }

    return <div className='user-container'>
        <Dropdown 
            trigger={<div className='d-flex align-items-center gap-1'>
                <Avatar 
                    src={user?.image || require('../../../assets/users/beatriz.jpg')}
                />
                
                {!hideName && <div className='user__info'>
                    <span className='user__name'>{user?.name || 'Beatriz'}</span>
                </div>}

                <MdKeyboardArrowDown className='user-container--icon'/>
            </div>}
            placement='top-end'
            hideDropdownIcon
        >
            <DropdownContent>
                <DropdownItem onClick={() => navigate('/dashboard/account/profile')}>
                    <span className="material-symbols-outlined size-20">account_circle</span>
                    <span>My Profile</span>
                </DropdownItem>
                <DropdownItem onClick={() => navigate('/dashboard/account/settings')}>
                    <span className="material-symbols-outlined size-20">admin_panel_settings</span>
                    <span>Account Settings</span>
                </DropdownItem>
                <DropdownItem>
                    <span className="material-symbols-outlined size-20">support</span>
                    <span>Support</span>
                </DropdownItem>
                <DropdownItem onClick={() => sigout()}>
                    <span className="material-symbols-outlined size-20">logout</span>
                    <span>Logout</span>
                </DropdownItem>
            </DropdownContent>
        </Dropdown>

    </div>
}