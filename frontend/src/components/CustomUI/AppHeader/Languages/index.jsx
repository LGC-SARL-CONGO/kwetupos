import React, { useState, useEffect } from 'react';

import { useLocalStorage } from '../../../../hooks/useLocalStorage';

import { Dropdown, DropdownContent, DropdownItem } from '../../../BaseUI/Dropdown';

import { MdKeyboardArrowDown } from "react-icons/md";

import styles from './Languages.module.scss';

export default function Languages() {
    const [language, setLanguage] = useState(null)

    const {
        getStorage,
        persistStorage
    } = useLocalStorage()

    useEffect(() => {
        setLanguage(getStorage('lang') || 'en-US')
    }, [])

    const languages = [
        {image: require('../../../../assets/countries/estados-unidos.png'), name: 'English', lang: 'en-US'},
        {image: require('../../../../assets/countries/brazil.png'), name: 'Brazilian Portuguese', lang: 'pt-BR'},
        {image: require('../../../../assets/countries/espanha.png'), name: 'Spanish', lang: 'es-ES'},
    ]

    const defaultLanguage = languages.filter(lang => lang.lang === language)[0]

    const handleLanguageSelection = language => {
        persistStorage('lang', language?.lang)

        window.location.reload()
    }

    return <div className={styles['languages-container']}>
        <Dropdown 
            trigger={<>
               <div className={styles['default__selector']}>
                    <div className='d-flex align-items-center gap-1'>
                        <div className='avatar-24'>
                            <img src={defaultLanguage?.image} alt={defaultLanguage?.name} />
                        </div>
                        <div>{ defaultLanguage?.name }</div>
                    </div>

                    <MdKeyboardArrowDown className={styles['default__selector--icon']} />
                </div>

                <div className={styles['selector__sm']}>
                    <div className={styles['selector']}>
                        <img src={defaultLanguage?.image} alt={defaultLanguage?.name} />
                    </div>
                </div>
            </>}
            placement='top-end'
            hideDropdownIcon
        >    
            <DropdownContent className={styles['custom__content']}>
                {languages.map((language, index) => (
                    <DropdownItem key={index} onClick={() => handleLanguageSelection(language)}>
                        <div className='avatar-24'>
                            <img src={language.image} alt={language.name} />
                        </div>
                        <div>{ language.name }</div>
                    </DropdownItem>
                ))}
            </DropdownContent>
        </Dropdown>
    </div>
}
    