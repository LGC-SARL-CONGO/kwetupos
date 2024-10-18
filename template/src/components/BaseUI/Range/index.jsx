import React, {useRef, useState, useEffect} from 'react';
import { v4 as uuidv4 } from 'uuid'

import styles from './Range.module.scss';

export default function Range({value: propValue, min, max, step, onChange, disabled, showValue}) {
    const inputRef = useRef(null)
    const progressRef = useRef(null)
    const rangeId = `range-${uuidv4()}`
    
    const [value, setValue] = useState(0)

    useEffect(() => {
        if (propValue) setTimeout(() => handleRange(propValue), 1000);
    }, [propValue])

    useEffect(() => {
        const handleResize = () => setTimeout(() => handleRange(value), 1000);

        window.addEventListener('resize', handleResize)
    
        return () => {
            window.removeEventListener('resize', handleResize)
        };
    }, [value]);

    const handleRange = (value) => {
        if (!value) return;

        setValue(value)
        setOffset(value)
    }

    const scale = (value, min, max, outMin, outMax) => ((value - min) * (outMax - outMin)) / (max - min) + outMin

    const setOffset = value => {
        const minValue = min || 0; 
        const maxValue = max || 100;
    
        const progressFilledArea = (value - minValue) / (maxValue - minValue) * 100
        const colorAreaFilled = disabled ? '#C0C6CF' : '#42516D'
        const colorAreaNotFilled = disabled ? '#F3F4F6' : '#DEE0E5'
        const offsetWithValue = ((value - minValue) / (maxValue - minValue)) * inputRef?.current?.offsetWidth - progressRef?.current?.offsetWidth / 2 + scale(value, minValue, maxValue, 10, -10);


        const { style } = inputRef?.current;
        style.height = '4px';
        style.background = `linear-gradient(to right, ${colorAreaFilled} 0%, ${colorAreaFilled} ${progressFilledArea}%, ${colorAreaNotFilled} ${progressFilledArea - 100}%, ${colorAreaNotFilled} 100%)`

        if (progressRef?.current) progressRef.current.style.left = `${offsetWithValue}px`
    }

    return <div className={styles['range-container']}>
        <input 
            type="range" 
            id={rangeId}
            ref={inputRef}
            className={`${styles['range-container__range']}`}
            value={value || 0}
            min={min}
            max={max}
            step={step}
            onChange={(event) => handleRange(event.target.value)}
            disabled={disabled}
        />

        {showValue && <div className={styles['range-container__progress']} ref={progressRef}>{value}</div>}
    </div>
}