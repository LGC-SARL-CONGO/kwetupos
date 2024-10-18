import React, { useState, useEffect, useRef } from 'react';

import styles from './Accordion.module.scss';

export default function Accordion({items, children, borderless, accordionClassName, accordionItemClassName, gap}) {
 
    const [activeTab, setActiveTab] = useState(0)
    const [height, setHeight] = useState(0)

    const accordionRef = useRef([])

    useEffect(() => {
        handleActivateTab(activeTab)
    }, [])

    const handleActivateTab = index => {
        setHeight(0)

        if (activeTab === index) {
            return setActiveTab(-1)
        }

        handleAccordionItem(index)

        setActiveTab(index)

        setTimeout(() => {
            return setHeight(accordionRef.current[index]?.scrollHeight) 
        }, 10);
    }

    const handleAccordionItem = currentItem => {

        const items = document.querySelectorAll('.accordion-item-container')

        const childrenItem = accordionRef?.current

        for (let index = 0; index < items.length; index++) {
            if (index < items.length) {
                if (currentItem === index) {
                    childrenItem[index].innerHTML = items[index].innerHTML
                }
            }       
        }
    }

    return <div className={`${styles['accordion-container']} ${!gap && styles['accordion-container--full']} ${borderless && styles['accordion-container--borderless']}`} style={{...(gap && { gap })}}>
        {items?.map((item, index) => (
           <div key={index} className={`${styles['accordion']} ${borderless && styles['accordion--borderless']} ${accordionClassName}`}>
                <div className={`${styles['accordion__header']} ${activeTab === index && styles['active']} ${accordionItemClassName}`} onClick={() => handleActivateTab(index)}>
                    <span>
                        { item.title }
                    </span>
                    <span className={`material-symbols-outlined ${activeTab === index && styles['rotate']}`}>expand_more</span>
                </div>

                <div className={`${styles['accordion__inner']} ${activeTab === index && styles['visible']}`} ref={element => accordionRef.current[index] = element} style={{ height: activeTab === index ? `${height}px` : '0px' }}>
                    <div className={styles['inner__content']}>
                        { item?.content || children}
                    </div>
                </div>
           </div>
        ))}
    </div>
}