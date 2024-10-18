import { useState, useEffect } from "react";
import moment from "moment";

import { useLocalStorage } from "../hooks/useLocalStorage";

export const useAuth = () => {
    const [isAuthenticated, setIsAuthenticated] = useState(false)
    const {
        getStorage,
        persistStorage,
        clearStorage
    } = useLocalStorage()

    const generateToken = (n = 48) => {
        const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
        let token = ''

        for(let i = 0; i < n; i++) {
            token += chars[Math.floor(Math.random() * chars.length)]
        }

        return token;
    }

    const auth = () => {
        const now = moment().valueOf()
        const storage = getStorage('magnunToken')

        if (!storage) return false
        if (now > storage?.expires) return false

        return true
    }

    const login = async (email, password) => {
        const {host, protocol} = window.location

        if (email === 'admin@magun.com' && password === '123456') {
            persistStorage('magnunToken', {
                expires: moment().add(7, 'days').valueOf(),
                host:  `${protocol}//${host}`,
                value: generateToken()
            })
            return true
        }

        return false
      
    }

    const logout = () => {
        clearStorage('magnunToken')

        return true
    }

    return {auth, login, logout}
}
