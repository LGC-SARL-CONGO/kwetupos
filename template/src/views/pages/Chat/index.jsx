import React from 'react';
import { translate } from '../../../hooks/translate';

import AppPage from '../../../components/CustomUI/AppPage';
import AppChat from '../../../components/CustomUI/AppChat'; 

const Chat = () => {
    return <AppPage title={translate('MENU.CHAT')}>
        <AppChat />
    </AppPage>
}

export default Chat;
