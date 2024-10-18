import React, { useState, useEffect, useRef } from 'react';
import { v4 as uuidv4 } from 'uuid'

import styles from './Tabs.module.scss';

export const Tabs = ({ children, tabs, selected }) => {
    const [activeTab, setActiveTab] = useState(0)
    const tabRef = useRef(uuidv4())

    useEffect(() => handleActiveTab(0), [])

    useEffect(() => {
        if (selected) {
            handleClickTab(selected - 1)
        }
    }, [selected])

    const handleClickTab = currentTab => {
        if (currentTab === activeTab) return

        setActiveTab(currentTab)

        handleActiveTab(currentTab)
    }

    const handleActiveTab = currentTab => {
        const childrens = tabRef.current.childNodes[1]

        childrens.childNodes.forEach((children, index) => {
            children.classList.remove('active')

            if (currentTab === index) {
                children.style.display = 'block'
            } else {
                children.style.display = 'none'
            }
        })
    }

    return <div className={styles['tabs-container']} ref={tabRef}>
       <div className={styles['tabs-container__header']}>
            {tabs?.map((tab, index) => (
                <div key={index} className={`${styles['tab-item']} ${activeTab === index ? styles['tab-item--active'] : ''}`} onClick={() => handleClickTab(index)}>
                    <span className={styles['tab-item__title']}>{ tab.title }</span>
                </div>
            ))}
       </div>

        <div className={styles['tabs-container__content']}>
            {children}
        </div>
    </div>
}

export const TabContent = ({ children }) => {
    return <div className={styles['tab-container']}>{children}</div>
}