const language = global.config.language

const useDateFormat = value => (new Date(value?.replaceAll('-', '/'))).toLocaleDateString(language)

export default useDateFormat;
