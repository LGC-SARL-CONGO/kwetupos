import React, { useState, useEffect, useRef } from 'react';
import { useChat } from '../../../../hooks/useChat';
import { useTheme } from '../../../../hooks/useTheme';
import { translate } from '../../../../hooks/translate';

import ListUser from './ListUser';

import { MdOutlineSearch } from "react-icons/md";
import { IoSearch } from "react-icons/io5";

import styles from './ContactList.module.scss';

export default function ContactList({onClick}) {
    const [messages, setMessages] = useState([
        {id: 1, name: 'Sarah Wins', image: require('../../../../assets/users/beatriz.jpg'), time: '11:45 AM', message: `Okay. Let's set up a new meeting`, selected: false, online: true},
        {id: 2, name: 'Jennyfer Whatson', image: require('../../../../assets/users/jennyfer.jpg'), time: '18:20 PM', message: `I did. Give me your email and I'll send it to you.`, selected: true, online: true},
        {id: 3, name: 'Jonathan Stark', image: '', time: '21 Jan', message: 'See you today at college', selected: false, online: false},
        {id: 4, name: 'Emmilly  Jordan', image: require('../../../../assets/users/emmilly.jpg'), time: '', message: '', selected: false, online: false},
        {id: 5, name: 'Esther Duarte', image: '', time: '', message: '', selected: false, online: false},
        {id: 6, name: 'Cláudio Dias', image: '', time: '', message: '', selected: false, online: false},
        {id: 7, name: 'Laura Lima', image: '', time: '', message: '', selected: false, online: false},
        {id: 8, name: 'Carolina Ferreira', image: '', time: '', message: '', selected: false, online: false}
    ])
    const [users, setUsers] = useState()
    const [searchField, setSearchField] = useState('')

    const { chat } = useChat()
    const theme = useTheme()

    const inputRef = useRef(null)

   

    useEffect(() => {
        messages?.forEach(message => {
            message.selected = false

            if (message.id === chat?.id) message.selected = true
        })

        setMessages([...messages])
        setUsers(messages)

        inputRef.current.value = ''
    }, [chat])

    const searchUsers = field => {
        if (!field) {
            setUsers([...messages])

            return
        }

        const filtered = messages.filter(message => message.name.toLowerCase().includes(field.toLowerCase()))

        setUsers([...filtered])
    }


    return <div className={`${styles['contacts-container']} ${styles[theme]}`} id='contacts-container'>
        <div className={styles['contacts-container__search']}>
            <input type="text" placeholder={`${translate('UI.SEARCH')}...`} className={styles['contacts-container__search--input']} onChange={(e) => searchUsers(e.target.value)} ref={inputRef}/>
            <MdOutlineSearch className={styles['contacts-container__search--icon']}/>
        </div>

        <div className={styles['contacts-container__list']}>
            {users?.map((message, index) => <ListUser key={index} infos={message} onClick={() => onClick?.()}/>)}
        </div>
    </div>
}