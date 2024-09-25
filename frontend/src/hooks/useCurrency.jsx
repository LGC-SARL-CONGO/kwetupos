const currency = global.config.currency

const useCurrency = value => value.toLocaleString(currency.language, { style: 'currency', currency: currency.name })

export default useCurrency;
