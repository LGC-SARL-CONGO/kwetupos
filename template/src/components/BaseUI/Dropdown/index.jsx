import React, { useRef, useEffect, useState } from 'react';
import { v4 as uuidv4 } from 'uuid'

import useOutsideClick from '../../../useOut';
import { useDropdown } from '../../../hooks/useDropdown';
import DropdownProvider from '../../../contexts/dropdown';

import { MdKeyboardArrowDown } from "react-icons/md";

import styles from './Dropdown.module.scss';

export const Dropdown = ({ children, placement, trigger, triggerClassName, hideDropdownIcon }) => {
    const parentRef = useRef(uuidv4())

    return <div className={`${styles['dropdown-container']} ${styles[global.config.theme]}`} ref={parentRef}>
        <DropdownProvider placement={placement} trigger={trigger}>
            <DropdownTitle className={triggerClassName} hideIcon={hideDropdownIcon}/>

            {children}
        </DropdownProvider>
    </div>
}

export const DropdownTitle = ({ className, hideIcon }) => {
    const { visible, setVisible, trigger } = useDropdown()

    return <span className={`d-flex align-items-center gap-1 ${typeof trigger === 'string' || trigger?.type?.hasOwnProperty('prototype') ? styles['dropdown-container__trigger'] : ''} ${className || ''}`} onClick={() => setVisible(!visible)}>
        {trigger}

        {!hideIcon && <MdKeyboardArrowDown />}
    </span>
}

export const DropdownContent = ({ className, children }) => {
    const { visible, setVisible, placement } = useDropdown();
    const dropdownRef = useRef(uuidv4());
    const [parentRef, setParentRef] = useState({ current: null });
    const [calculatedDirection, setCalculatedDirection] = useState(placement);
  
    useEffect(() => {
      setTimeout(() => {
        setParentRef({ current: dropdownRef?.current?.parentElement });
      }, 1);
    }, []);


    useEffect(() => {
        const recalculatePosition = () => {
        const parentElement = parentRef.current;
        const dropdownElement = dropdownRef.current;
    
        if (!parentElement || !dropdownElement) return;
    
        const parentRect = parentElement.getBoundingClientRect();
        const dropdownRect = dropdownElement.getBoundingClientRect();
    
        const scrollBarHeight = window.innerWidth - document.documentElement.clientWidth;
    
        const spaceBelow = window.innerHeight - parentRect.bottom - scrollBarHeight;
        const spaceAbove = parentRect.top - scrollBarHeight;
    
        let newDirection = placement;

        if (!placement) {
            newDirection = spaceAbove < dropdownRect.height ? 'default-top' : 'default-bottom';
        } 

        if (placement === 'bottom-end') {
            newDirection = spaceAbove < dropdownRect.height ? 'top-end' : 'bottom-end';
        } 
        
        if (placement === 'top-end') {
            newDirection = spaceBelow < dropdownRect.height ? 'bottom-end' : 'top-end';
        } 

        if (placement === 'bottom-start' && spaceBelow < dropdownRect.height) {
            newDirection = spaceAbove < dropdownRect.height ? 'top-start' : 'bottom-start';
        } 

        if (placement === 'top-start' && spaceAbove < dropdownRect.height) {
            newDirection = spaceBelow < dropdownRect.height ? 'bottom-start' : 'top-start';
        }
    
        setCalculatedDirection(newDirection);
        };
    
        const handleScroll = () => {
        recalculatePosition();
        };
    
        recalculatePosition();
    
        window.addEventListener('resize', recalculatePosition);
        document.getElementById('default-main')?.addEventListener('scroll', handleScroll);
    
        return () => {
            window.removeEventListener('resize', recalculatePosition);
            document.getElementById('default-main')?.removeEventListener('scroll', handleScroll);
        };
    }, [placement, parentRef]);
  
    useOutsideClick(parentRef, () => setVisible(false));
  
    return (
      <div
        className={`${styles['dropdown-container__content']} ${className} ${
          visible ? `${styles.visible}` : ''
        } ${styles[calculatedDirection]}`}
        ref={dropdownRef}
      >
        <ul className={`${styles.content__list}`}>{children}</ul>
      </div>
    );
};
  
  

export const DropdownItem = ({ children, onClick }) => {
    const { setVisible } = useDropdown()
    return <div className={`${styles.dropdown__item}`} onClick={(event) => {onClick?.(event); setVisible(false)}}>{children}</div>
}
