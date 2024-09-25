import { useContext } from 'react';
import { ThemeContext } from '../contexts/theme'

import config from '../config';

export const useTheme = () => {
    const { theme } = useContext(ThemeContext)

    config.theme = theme
    
    return theme
}
