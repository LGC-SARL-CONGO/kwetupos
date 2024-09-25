import React, { useState } from 'react';

import styles from './Switch.module.scss';

export default function Switch({ label, value, checked, onChecked }) {
    const [toggled, setToggled] = useState(checked || false)

    return <div className={styles['switch-container']}>
        <label className={styles['switch-container__switch']}>
            <input type="checkbox" className={styles['switch-container__switch--input']} checked={toggled} onChange={() => {setToggled(!toggled); onChecked?.(!toggled)}}/>
            <span className={styles['switch-container__switch--slider']}></span>
        </label>

        <span>{label}</span>
    </div>
}