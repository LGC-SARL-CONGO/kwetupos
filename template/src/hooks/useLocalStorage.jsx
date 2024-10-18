export const useLocalStorage = () => {
    const getStorage = key => {
        const saved = localStorage.getItem(key)

        return saved ? JSON.parse(saved) : null 
    }

    const persistStorage = (key, value) => {
        const storage = getStorage(key)

        if (storage) clearStorage(key)
        
        localStorage.setItem(key, JSON.stringify(value))
    }

    const clearStorage = key => localStorage.removeItem(key)

    return {
        getStorage,
        persistStorage,
        clearStorage
    }
}