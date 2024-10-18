import React from 'react';

import { translate } from '../../../../hooks/translate';

import {Table, Tr, Td} from '../../../../components/BaseUI/Table';
import Checkbox from "../../../../components/BaseUI/Checkbox";


export default function Notifications({ onChange }) {
    const headers = [
        { name: translate('ACCOUNT_SETTINGS.TYPE'), resizable: true },
        { name: 'E-mail', resizable: false },
        { name: 'Browser', resizable: false },
        { name: 'App', resizable: false },
    ]

    const notifications = [
        { type: 'New device connected', email: true, browser: true, app: true },
        { type: 'Suspicious login attempt', email: true, browser: false, app: true },
        { type: 'Account Activity Alert', email: true, browser: false, app: false },
        { type: 'Unauthorized access warning', email: true, browser: true, app: false },
        { type: 'Connection dtected: Verify your account', email: true, browser: true, app: false }
    ]
      

    return  <div className='account-settings-container__basic-information'>
        <h4>{translate('ACCOUNT_SETTINGS.MANAGE_YOUR_NOTIFICATIONS')}</h4>

        <Table
            columns={headers}
            identifier="notifications_list"
        >
            {notifications?.map((notification, index) => (
                <Tr key={index}>
                    <Td>{notification?.type}</Td>
                    <Td>
                        <Checkbox isChecked={notification?.email}/>
                    </Td>
                    <Td>
                        <Checkbox isChecked={notification?.browser}/>
                    </Td>
                    <Td>
                        <Checkbox isChecked={notification?.app}/>
                    </Td>
                </Tr>
            ))}

        </Table>
    </div>
}