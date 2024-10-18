import React from 'react';

import styles from './RenderHTML.module.scss';

export default function RenderHTML({children}) {
    return <div dangerouslySetInnerHTML={{ __html: children}} className={styles['render-html-container']}></div>
}