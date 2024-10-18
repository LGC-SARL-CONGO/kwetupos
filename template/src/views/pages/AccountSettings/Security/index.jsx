import React, {useState} from 'react';

import { translate } from '../../../../hooks/translate';

import Input from '../../../../components/BaseUI/Input';
import Button from '../../../../components/BaseUI/Button';
import Container from '../../../../components/CustomUI/Container';
import ContainerItem from '../../../../components/CustomUI/Container/ContainerItem';
import Switch from '../../../../components/BaseUI/Switch';

export default function Security({ onChange }) {
    const [twoFactorAuthentication, setTwoFactorAuthentication] = useState(false)

    return  <div className='account-settings-container__basic-information'>
        <h4>{translate('ACCOUNT_SETTINGS.CHANGE_PASSWORD')}</h4>

        <Container className='mt-4'>
            <ContainerItem sm={4} md={4} xl={5}>
                <Input
                    label={translate('ACCOUNT_SETTINGS.CURRENT_PASSWORD')}
                    placeholder={translate('ACCOUNT_SETTINGS.ENTER_CURRENT_PASSWORD')}
                    required
                />
            </ContainerItem>
        </Container>

        <Container className='mb-3'>
            <ContainerItem sm={4} md={4} xl={5}>
                <Input
                    label={translate('ACCOUNT_SETTINGS.NEW_PASSWORD')}
                    placeholder={translate('ACCOUNT_SETTINGS.ENTER_NEW_PASSWORD')}
                />
            </ContainerItem>
        </Container>
       
        <Button appearance='primary'>{translate('ACCOUNT_SETTINGS.SAVE_CHANGES')}</Button>

        <div className='mt-5'>
            <h4 className='mb-3'>{translate('ACCOUNT_SETTINGS.TWO_STEP_VERIFICATION')}</h4>

            <Switch 
                label={twoFactorAuthentication ? translate('ACCOUNT_SETTINGS.ENABLED') : translate('ACCOUNT_SETTINGS.DISABLED')}
                value={twoFactorAuthentication}
                onChecked={(value) => setTwoFactorAuthentication(value)}
            />

            {twoFactorAuthentication && <div className='w-50 d-flex align-items-center gap-1'>
                <div>
                    <Input placeholder='(xx) xxxxx-xxxx'/>
                </div>

                <div style={{ marginTop: '-5px' }}>
                    <Button appearance='primary'>{translate('ACCOUNT_SETTINGS.ENABLE')}</Button>
                </div>
            </div>}
        </div>

    </div>
}