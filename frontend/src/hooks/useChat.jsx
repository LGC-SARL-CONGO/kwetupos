import { useContext } from 'react';

import { ChatContext } from '../contexts/chat'

export const useChat = () => {
    const { chat, setChat } = useContext(ChatContext)

    return {chat, setChat}
}
