import React, {useEffect, useState, useRef} from 'react';
import { v4 as uuidv4 } from 'uuid'

import styles from './Checkbox.module.scss';

export default function Checkbox({ value, label, disabled, inValid, message, isChecked, isIndeterminate, onChange }) {
    const [checked, setChecked] = useState(false)

    const inputRef = useRef(null)
    const checkboxId = `checkbox-${uuidv4()}`

    useEffect(() => {
        setChecked(isChecked)
    }, [isChecked])

    const handleChange = event => {
        setChecked(event.target.checked)
        onChange?.({value: value, checked: event.target.checked})
    }

    const handleLabelClick = event => {
        if (disabled) event.preventDefault()
    }

    return <div className={`${styles['checkbox-container']} ${disabled ? styles['checkbox-container--disabled'] : ''}`}>
        <div className="d-flex align-items-center gap-1">
            <input 
                type="checkbox" 
                value={value}
                id={checkboxId} 
                checked={checked}
                className={`${styles['checkbox-container__checkbox']} ${isIndeterminate ? styles['checkbox-container__checkbox--indeterminate'] : ''} ${inValid ? styles['checkbox-container__checkbox--invalid'] : ''}`} 
                ref={inputRef} 
                onChange={handleChange}
                disabled={disabled}
            />

            <label 
                className={`${styles['checkbox-container__label']}`} 
                htmlFor={checkboxId}
                onClick={handleLabelClick}
            >{label}</label>
        </div>

        {inValid && <span className={`${styles['checkbox-container__message']}`}>
            {inValid && message ? message : 'Invalid field'}
        </span>}
    </div>
}