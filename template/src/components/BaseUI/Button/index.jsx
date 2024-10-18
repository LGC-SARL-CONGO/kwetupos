import React, {useState, useEffect} from 'react';
import { useTheme } from '../../../hooks/useTheme';
import styles from './Button.module.scss';

const Button = ({appearance = 'default', className = '', children, disabled, onClick, title, justify, radius, isBlock, size, useIcon, shape}) => {
    const theme = useTheme();
    const [isIcon, setisIcon] = useState(false)

    useEffect(() => {
        setisIcon(children?.type && typeof children?.type === 'function' ? true : false)

    }, [children])

    const containerClass = `${styles['button-container']} ${isBlock && styles['button-container__block']} ${className}`;
    const buttonClass = `${styles['button-container__button']} ${styles[appearance]} ${disabled && styles['button-container__button--disabled']}`;
    const borderRadiusStyle = { borderRadius: radius && `${radius}px` };

    const buttonType = `${!isIcon ? styles['button-text'] : styles['button-icon']}`

    const buttonSize = () => {
        if (!isIcon) {
            return `${size !== undefined ? styles[`button-text--${size}`] : styles['button-text--default']}`
        }

        return `${size !== undefined ? styles[`button-icon--${size}`] : styles['button-icon--default']}`
    }

    return <div className={containerClass} style={{ justifyContent: justify || 'flex-start' }} data-theme={theme}>
        <button className={`${buttonClass} ${buttonSize()} ${buttonType} ${isIcon && styles[`button-icon--${shape || 'circle'}`]}`} style={borderRadiusStyle} disabled={disabled} onClick={onClick}>
            {useIcon?.direction === 'left' && <span className={`${styles['use-icon']} d-flex`}>{useIcon?.icon}</span>}

            <span className={`${styles['button-title']} ${isBlock && styles['button-title--centered']}`}>{title || children}</span>

            {useIcon?.direction === 'right' && <span className={`${styles['use-icon']} d-flex`}>{useIcon?.icon}</span>}
        </button>
    </div>
};

export default Button;