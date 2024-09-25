import React from "react";

import currencyOptions from '../currencyToLocale'

const useFormatMoney = (value) => {
    const currency = Object.keys(currencyOptions.options).find(key => currencyOptions.options[key] === currencyOptions.default)
        
    return new Intl.NumberFormat(currencyOptions.default, { style: 'currency', currency: currency }).format(value)
};

export default useFormatMoney;