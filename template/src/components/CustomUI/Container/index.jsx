import React from 'react';

export default function Container({ children, display, className }) {
    return <div className={`${display ? `${display}-container` : 'grid-container'} ${className}`}>{ children }</div>
}