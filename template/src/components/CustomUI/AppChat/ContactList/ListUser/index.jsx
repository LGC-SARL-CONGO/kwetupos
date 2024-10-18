import React from 'react';

import { useChat } from '../../../../../hooks/useChat';
import { useTheme } from '../../../../../hooks/useTheme';
 
import Avatar from '../../../Avatar';

import styles from './ListUser.module.scss';

export default function ListUser({infos, onClick}) {
    const {name, image, time, message, selected, online} = infos

    const { setChat } = useChat()
    const theme = useTheme()

    return <div className={`${styles['list-user-container']} ${selected ? styles.selected : ''} ${styles[theme]}`} onClick={() => {setChat({...infos}); onClick?.()}}>
            <Avatar name={name} image={image} status={online ? 'online' : 'offline'}/>

            <div className={styles['list-user-container__info']}>
                <div className='d-flex align-items-center justify-content-between'>
                    <span className={styles['list-user-container__info--name']}>{name}</span>
                    <span className={styles['list-user-container__info--hour']}>{time}</span>
                </div>
                <span className={styles['list-user-container__info--message']}>{message}</span>
            </div>
    </div>
}