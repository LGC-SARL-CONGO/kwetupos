import React from 'react';
import moment from 'moment';

import { useTheme } from '../../../../hooks/useTheme';

import { Dropdown, DropdownContent, DropdownItem } from '../../../BaseUI/Dropdown';
import Badge from '../../../BaseUI/Badge';
import Avatar from '../../Avatar';

import { MdNotificationsNone } from "react-icons/md";

import styles from './Notifications.module.scss';

export default function Notifications({values}) {
    const theme = useTheme()

    const formatDate = value => {
        const date = moment(value)

        const now = moment()

        const difference = now.diff(date, 'days');

        if (difference === 0) return date.format('HH:mm')
        // if (difference <= 365) return `${date.format('DD')} de ${date.format('MMM')}`
        if (difference <= 365) return date.format('DD MMM')

        return date.format('DD/MM/YYYY')
    }

    return <div className={styles['notifications-container']} data-theme={theme}>
        <Dropdown 
            trigger={<Badge appearance='danger'>
                <MdNotificationsNone style={{fontSize: '20px'}}/>
                </Badge>
            }
            placement='top-end'
            hideDropdownIcon={true}
            triggerClassName={styles['notifications-container__notification']}
        >
            <DropdownContent className={styles['custom__content']}>
                <div className={styles['notifications-container__header']}>
                    <span className={styles['title']}>Notificações</span>
                    <span className={styles['link']}>Ver todas</span>
                </div>

                {values.map((notification, index) => (
                    <DropdownItem key={index}>
                        <div className={styles['notifications-container__content']}>
                        <div className={styles['notifications-container__content__info']}>
                                <div className='d-flex align-items-start'>
                                    <Avatar name={notification.user} />
                                    <span className={styles['user']}>{notification.user}</span>
                                </div>
                                <span className={styles['date']}>{formatDate(notification.date)}</span>
                        </div>

                        <div className={styles['subject']}>{notification.subject}</div>
                        </div>
                    </DropdownItem>
                ))}
            </DropdownContent>
        </Dropdown>
    </div>

}