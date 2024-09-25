import currencyOptions from '../currencyToLocale'

export const useFormatValue = (value, type) => {
    const lang = localStorage.getItem('lang')?.split('"')[1] || null 
    
    const currency = Object.keys(currencyOptions.options).find(key => currencyOptions.options[key] === lang)

    if (type === 'percentage') return `${value}%`
    if (type === 'number') return new Intl.NumberFormat(lang).format(value)
    if (type === 'money') return new Intl.NumberFormat(lang, { style: 'currency', currency: currency }).format(value)
    if (type === 'date') return (new Date(value)).toLocaleDateString(lang)

    return value
}