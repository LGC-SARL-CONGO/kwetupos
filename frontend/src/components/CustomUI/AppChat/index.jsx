import React, {useState, useEffect} from 'react';
import ChatProvider from '../../../contexts/chat';

import Container from '../Container'
import ContainerItem from '../Container/ContainerItem'
import ContactList from './ContactList';
import Messages from './Messages';

export default function AppChat() {
    const [displayMessage, setDisplayMessage] = useState(false)
    const [defaultView, setDefaultView] = useState(false)

    useEffect(() => {
        const screenSize = window.innerWidth

        if (screenSize > 1024){
           setDefaultView(true)
        }

        window.addEventListener('resize', () => {
            if (screenSize > 1024){
                setDefaultView(true)
            }
        })
    }, [])

    return <ChatProvider>
        <Container>
            {(!displayMessage || defaultView) && <ContainerItem sm={4} md={8} xl={4}>
                <ContactList onClick={() => setDisplayMessage(true)} />
            </ContainerItem>
}
            {(displayMessage || defaultView) && <ContainerItem sm={4} md={8} xl={8}>
                <Messages  onBack={() => setDisplayMessage(false)}/>
            </ContainerItem>}
        </Container>
    </ChatProvider>
}