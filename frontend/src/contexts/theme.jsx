import { createContext } from "react";

import usePersistTheme from "../hooks/usePersistTheme";

export const ThemeContext = createContext({theme: 'light', undefined})

const ThemeProvider = ({ children }) => {
    const [theme, setTheme] = usePersistTheme('theme', 'light')
    const [sidebarTheme, setSidebarTheme] = usePersistTheme('sidebarTheme', 'light')
    const [topMenuTheme, setTopMenuTheme] = usePersistTheme('topMenuTheme', 'light')

    global.config.theme = theme

    return <ThemeContext.Provider value={{ theme, setTheme, sidebarTheme, setSidebarTheme, topMenuTheme, setTopMenuTheme }}>
        {children}
    </ThemeContext.Provider>
}

export default ThemeProvider;