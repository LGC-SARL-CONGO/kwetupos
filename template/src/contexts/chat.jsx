import { useState, createContext } from "react";

export const ChatContext = createContext({})

const ChatProvider = ({ children }) => {
    const [chat, setChat] = useState({})

    return <ChatContext.Provider value={{ chat, setChat }}>
        {children}
    </ChatContext.Provider>
}

export default ChatProvider;