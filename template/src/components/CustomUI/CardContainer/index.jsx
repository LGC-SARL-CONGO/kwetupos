import React from 'react';
import DropdownMenu from '../DropdownMenu';

import styles from './CardContainer.module.scss';

export default function CardContainer({ title, children, actions, className}) {

    return <div className={styles['card-container']}>
        {(title || actions) && <div className={styles['card-container__header']}>
            <div className={styles['card-container__header--title']}>{title}</div>
            <div className={styles['card-container__header--action']}>
                {actions?.length && <DropdownMenu options={actions}/>}
            </div>
        </div>}
        <div className={`${styles['card-container__content']} ${className}`}>
            {children}
        </div>
    </div>
}