import React, { useRef, useState, useEffect } from 'react';

import { MdCheckCircle } from "react-icons/md";
import { MdCancel } from "react-icons/md";

import styles from './Input.module.scss';

export default function Input({type, placeholder, value, label, onChange, money, disabled, onFocused, min, max, maxLength, required, valid, message, useIcon}) {
    const inputRef = useRef(null)

    const [input, setInput] = useState('')
    const [status, setStatus] = useState({valid: undefined})

    useEffect(() => {
        if (value) {
            setInput(value)
        }
    }, [value])

    useEffect(() => {
        if (onFocused) {
            setTimeout(() => {
                inputRef?.current?.focus()
            }, 0)
        }
    }, [onFocused])

    useEffect(() => {
        setStatus({
            valid: toBoolean(valid),
        })

    }, [valid])

    const toBoolean = value => {
        if (value === undefined) return undefined
        if (typeof value === 'string') return value?.toLowerCase() === 'true'
        return value
    }

    const onChangeInput = event => {
        onChange?.(event.target.value)
        setInput(event.target.value)
    }

    const applyClasses = () => {
        const classes = []

        if (status?.valid !== undefined) {
            if (status?.valid) classes.push('input-container__input--valid')
            else classes.push('input-container__input--invalid')
        }
        if (useIcon?.direction && useIcon?.direction === 'left') classes.push('input-container__input--icon-left')
        if (useIcon?.direction && useIcon?.direction === 'right') classes.push('input-container__input--icon-right')

        return classes
    }

    const statusClass = () => {
        if (status?.valid !== undefined) {
            if (status?.valid) return 'input-container__message--valid'
            else return 'input-container__message--invalid'
        }

        return 
    }

    const onFocus = event => {
        setStatus({
            valid: undefined,
        })
    }

    const onBlur = event => {
    }


    return <div className={styles['input-container']}>
        <label htmlFor={inputRef} className={styles['input-container__label']}>
            <span>{label}</span>{required && <span className={styles['input-container__label--required']}>*</span>}
        </label>

        <input 
            className={`${styles['input-container__input']} ${applyClasses()?.length ? styles[applyClasses().join(' ')] : ''}`} 
            type={type} 
            ref={inputRef} 
            value={input} 
            onChange={(event) => onChangeInput(event)} 
            disabled={disabled || false} 
            placeholder={placeholder} 
            min={min} 
            max={max} 
            maxLength={maxLength}
            onFocus={(event) => onFocus(event)}
            onBlur={(event) => onBlur(event)}
        />

        {(status?.valid !== undefined) && <span className={styles['input-container__input-icons']}>
            {status?.valid ? <MdCheckCircle className={styles['input-container__input-icons--valid']} /> : <MdCancel className={styles['input-container__input-icons--invalid']}/>}
        </span>}

        {useIcon?.direction && <span className={`${styles['input-container__use-icon']} ${styles[`input-container__use-icon--${useIcon?.direction}`]}`}>{useIcon?.icon}</span>}

        {(status?.valid !== undefined && message) && <span className={`${styles['input-container__message']} ${styles[statusClass()]}`}>{message || 'Required field'}</span>}
    </div>
}