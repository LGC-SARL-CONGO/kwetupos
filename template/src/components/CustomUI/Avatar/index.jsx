import React, {useState, useEffect, useRef} from 'react';

import styles from './Avatar.module.scss';
import avatar from '../../../assets/icons/avatar.png'

import { MdOutlinePhotoCamera } from "react-icons/md";

export default function Avatar({ src, name, size, status, borderColor, appearance, selection }) {
    const [useInitials, setUseInitials] = useState(false)
    const [imageSrc, setImageSrc] = useState('')

    const avatarRef = useRef(null)
    const imageRef = useRef(null)

    useEffect(() => {
        if (avatarRef?.current) {
            if (avatarRef?.current) {
                avatarRef.current.style.setProperty('--border-color-avatar', borderColor);
            }
        }
    }, [borderColor])

    useEffect(() => {
        if (src) setImageSrc(src)

        if (name && src) setUseInitials(false)
        else setUseInitials(true)
    }, [name, src])

    const colors = [
        {leters: 'RNXC', background: '#0153CC', color: '#fff'},
        {leters: 'BEMP', background: '#DD340A', color: '#fff'},
        {leters: 'ZDJH', background: '#FF9A1F', color: '#162949'},
        {leters: 'LTFI', background: '#1E2C47', color: '#fff'},
        {leters: 'VQGK', background: '#2385A5', color: '#162949'},
        {leters: 'WOAS', background: '#493A9E', color: '#fff'},
        {leters: 'UY', background: '#8DC43A', color: '#162949'},
    ]
   
    const getColors = name => {
        const letter = name?.split(' ')[0]?.toUpperCase()?.charAt(0)

        return {
            background: colors.filter(color => color.leters.includes(letter))[0]?.background || null,
            color: colors.filter(color => color.leters.includes(letter))[0]?.color || null,
        }
    }

    const getInitials = name => {
        if (!name) return

        const names = name.split(' ')
        let initials = names[0].substring(0, 1).toUpperCase()
    
        if (names.length > 1) {
            initials += names[names.length - 1].substring(0, 1).toUpperCase()
        }
        return initials
    }

    const selecionaAvatar = () => {
        if (!selection) return

        document.getElementById("uploadFile").click()
    }

    const handleFileSelection = file => {
        setImageSrc(URL.createObjectURL(file))
        setUseInitials(false)
    }
    
    return <div className={`${styles['avatar-container']} ${styles[`avatar-container__${size || 'default'}`]} ${styles[`avatar-container--${appearance || 'circle'}`]} ${selection && 'u-pointer'}`} ref={avatarRef} onClick={selecionaAvatar}>
        {(!imageSrc && !name) && <img src={avatar} alt='Avatar' />}

        {(imageSrc) && <img src={imageSrc} alt={name} ref={imageRef}/>}

        {useInitials && <div className={`${styles['avatar-container__initials']} ${styles[`avatar-container__initials--${size || 'default'}`]}`} style={{background: getColors(name)?.background, color: getColors(name)?.color}}>
            <span>{getInitials(name)}</span>
        </div>}

        {status && <div className={`${styles['avatar-container__status']} ${styles[`avatar-container__status--${status}`]}`}></div>}

        {selection && <>
            <input type='file' id='uploadFile'  onChange={(e) => handleFileSelection(e.target.files[0])} style={{ display: 'none'}}/>
            <div className={styles['avatar-container__edit']}>
                <MdOutlinePhotoCamera />
            </div>
        </>}
    </div>
}