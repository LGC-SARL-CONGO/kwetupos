import React, { useRef, useState, useEffect } from 'react';
import { MdCheckCircle, MdCancel } from "react-icons/md";
import styles from './Input.module.scss';

export default function Input({
    type,
    name,
    placeholder,
    value,
    label,
    onChange,
    money,
    disabled,
    onFocused,
    min,
    max,
    maxLength,
    required,
    valid,
    message,
    useIcon
}) {
    const inputRef = useRef(null);
    const [input, setInput] = useState(value || '');
    const [status, setStatus] = useState({ valid: undefined });

    useEffect(() => {
        setInput(value || '');
    }, [value]);

    useEffect(() => {
        if (onFocused) {
            setTimeout(() => {
                inputRef.current?.focus();
            }, 0);
        }
    }, [onFocused]);

    useEffect(() => {
        setStatus({ valid: toBoolean(valid) });
    }, [valid]);

    const toBoolean = (value) => {
        if (value === undefined) return undefined;
        if (typeof value === 'string') return value.toLowerCase() === 'true';
        return Boolean(value);
    };

    const onChangeInput = (event) => {
        if (event && event.target) {
            onChange?.(event.target.value, event.target.name);
            setInput(event.target.value);
        }
    };

    const applyClasses = () => {
        const classes = [];
        if (status?.valid !== undefined) {
            classes.push(status.valid ? 'input-container__input--valid' : 'input-container__input--invalid');
        }
        if (useIcon?.direction === 'left') classes.push('input-container__input--icon-left');
        if (useIcon?.direction === 'right') classes.push('input-container__input--icon-right');
        return classes;
    };

    const statusClass = () => {
        if (status?.valid !== undefined) {
            return status.valid ? 'input-container__message--valid' : 'input-container__message--invalid';
        }
        return '';
    };

    const onFocus = () => {
        setStatus({ valid: undefined });
    };

    return (
        <div className={styles['input-container']}>
            <label htmlFor={inputRef} className={styles['input-container__label']}>
                <span>{label}</span>
                {required && <span className={styles['input-container__label--required']}>*</span>}
            </label>
            <input
                className={`${styles['input-container__input']} ${applyClasses().join(' ')}`}
                type={type}
                name={name}
                ref={inputRef}
                value={input}
                onChange={onChangeInput}
                disabled={disabled || false}
                placeholder={placeholder}
                min={min}
                max={max}
                maxLength={maxLength}
                onFocus={onFocus}
                // onBlur={onBlur} // Ajouter la logique pour onBlur si nécessaire
            />
            {status?.valid !== undefined && (
                <span className={styles['input-container__input-icons']}>
                    {status.valid ? (
                        <MdCheckCircle className={styles['input-container__input-icons--valid']} />
                    ) : (
                        <MdCancel className={styles['input-container__input-icons--invalid']} />
                    )}
                </span>
            )}
            {useIcon?.direction && (
                <span className={`${styles['input-container__use-icon']} ${styles[`input-container__use-icon--${useIcon.direction}`]}`}>
                    {useIcon.icon}
                </span>
            )}
            {status?.valid !== undefined && message && (
                <span className={`${styles['input-container__message']} ${styles[statusClass()]}`}>
                    {message || 'Required field'}
                </span>
            )}
        </div>
    );
}
