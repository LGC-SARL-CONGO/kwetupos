import React from 'react';
import { translate } from '../../../../hooks/translate';

import CardContainer from '../../../../components/CustomUI/CardContainer';
import Tooltip from '../../../../components/BaseUI/Tooltip';
import ActionButton from '../../../../components/CustomUI/ActionButton';
import Input from '../../../../components/BaseUI/Input';
import RichTextEditor from '../../../../components/CustomUI/RichTextEditor';
import Button from '../../../../components/BaseUI/Button';

import { MdOutlineDelete } from "react-icons/md";

import styles from './EmailCompose.module.scss';

export default function EmailCompose() {
    return <CardContainer className={styles['email-compose-container']}>
        <div className='weight-500 mb-3'>{translate('EMAIL.NEW_MESSAGE')}</div>

        <Input type='text' placeholder={translate('EMAIL.TO')} />
        <Input type='text' placeholder={translate('EMAIL.SUBJECT')} />

        <RichTextEditor 
           focused
            height={150}
        />

        <div className='d-flex align-items-center justify-content-between'>
            <Button title={translate('UI.SEND')} appearance='primary'/>
            
            <div>
                <Tooltip content={translate('EMAIL.TO_DISCARD')}>
                    <ActionButton>
                        <MdOutlineDelete />
                    </ActionButton>
                </Tooltip>
            </div>

        </div>
    </CardContainer>
}