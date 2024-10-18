import React from 'react';

import styles from './Progress.module.scss';

export default function Progress({ progress, maxValue, color, height, showProgressLabel, showProgress }) {
    const calculatePercentage = () => `${parseInt((progress / (maxValue ? maxValue : 100) ) * 100)}%`

    return <div className={styles['progress-container']}>
        <div className={`${styles['progress-container__bar']}`} style={{ height: height }}>
            <div className={`${styles['bar-line']} ${progress > 99 ? styles['bar-radius'] : ''}`} style={{ width: calculatePercentage(), backgroundColor: color || '#005FED', height: height }}>
                {(showProgressLabel && progress > 2) && <span className={`${styles['bar-line--label']}`} style={{fontSize: height ? `calc(${height}px - 3px)` : '8px'}}>{progress}%</span>}
            </div>
        </div>

        {showProgress && <span>{progress}%</span>}
    </div>
}