import i18n from 'i18next';
import languageDetector from 'i18next-browser-languagedetector';

import { messages } from './languages/index'

const lang = localStorage.getItem('lang')

if (!lang) localStorage.setItem('lang', JSON.stringify('en-US'))

i18n
    .use(languageDetector)
    .init({
        resources: messages,
        lng: lang ? JSON.parse(lang)?.split('-')[0] : 'en',
        debug: false,
        defaultNS: ['translations'],
        fallbackLng: 'en',
        ns: ['translations'],
    })

export { i18n }