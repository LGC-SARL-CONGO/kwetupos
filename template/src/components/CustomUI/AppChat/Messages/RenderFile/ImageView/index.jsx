import React from 'react';

import styles from './ImageView.module.scss';

export default function ImageView({file}) {

    return <div className={styles['image-view-container']}>
        <img src={URL.createObjectURL(file)} alt={file?.name} />
    </div>
}