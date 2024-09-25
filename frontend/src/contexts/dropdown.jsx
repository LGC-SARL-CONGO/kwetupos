import { useState, createContext } from "react";

export const DropdownContext = createContext({})

const DropdownProvider = ({ children, placement, trigger }) => {
    const [visible, setVisible] = useState(false)

    return <DropdownContext.Provider value={{ visible, setVisible, placement, trigger }}>
        {children}
    </DropdownContext.Provider>
}

export default DropdownProvider;