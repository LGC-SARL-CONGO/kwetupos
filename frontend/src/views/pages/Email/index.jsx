import React, { useState, useEffect, useRef } from 'react';
import moment from 'moment/moment';

import { translate } from '../../../hooks/translate';

import useOutsideClick from '../../../useOut'

import AppPage from '../../../components/CustomUI/AppPage';
import Container from '../../../components/CustomUI/Container';
import ContainerItem from '../../../components/CustomUI/Container/ContainerItem';
import CardContainer from '../../../components/CustomUI/CardContainer';
import Button from '../../../components/BaseUI/Button';
import Tooltip from '../../../components/BaseUI/Tooltip';
import Pagination from '../../../components/BaseUI/Pagination';
import Avatar from '../../../components/CustomUI/Avatar';

import ReadEmail from './ReadEmail';
import EmailCompose from './EmailCompose';

import { MdStarBorder } from "react-icons/md";
import { MdStar } from "react-icons/md";
import { MdAccessTime } from "react-icons/md";
import { MdOutlineInsertDriveFile } from "react-icons/md";
import { MdOutlineReport } from "react-icons/md";
import { MdOutlineDeleteOutline } from "react-icons/md";
import { MdOutlineStarOutline } from "react-icons/md";
import { MdOutlineInbox } from "react-icons/md";
import { MdForwardToInbox } from "react-icons/md";
import { MdCheckBoxOutlineBlank } from "react-icons/md";
import { MdCheckBox } from "react-icons/md";
import { MdRefresh } from "react-icons/md";
import { MdOutlineArchive } from "react-icons/md";
import { MdOutlineDrafts } from "react-icons/md";
import { MdOutlineAdd } from "react-icons/md";
import { MdSearch } from "react-icons/md";
import { MdOutlineClose } from "react-icons/md";

import EmailsJSON from '../../../mocks/emails.json';

import styles from './Email.module.scss';

export default function Email() {
    const [emailActions, setEmailActions] = useState([
        {name: translate('EMAIL.INBOX'), type: 'inbox', icon: <MdOutlineInbox />, link: '', quantity: 13, active: true},
        {name: translate('EMAIL.WITH_STAR'), type: 'starred', icon: <MdStarBorder />, link: '', quantity: 8, active: false},
        {name: translate('EMAIL.POSTPONED'), type: 'postponed', icon: <MdAccessTime />, link: '', quantity: 2, active: false},
        {name: translate('EMAIL.SENT'), type: 'send', icon: <MdForwardToInbox />, link: '', quantity: 18, active: false},
        {name: translate('EMAIL.DRAFTS'), type: 'draft', icon: <MdOutlineInsertDriveFile />, link: '', quantity: 1, active: false},
        {name: translate('EMAIL.SPAM'), type: 'spam', icon: <MdOutlineReport />, link: '', quantity: 0, active: false},
        {name: translate('EMAIL.BIN'), type: 'deleted', icon: <MdOutlineDeleteOutline />, link: '', quantity: 3, active: false},
    ])
    const [emails, setEmails] = useState([...EmailsJSON?.sort((a, b) => moment(b.date) - moment(a.date))])
    const [messageDetail, setMessageDetail] = useState({})
    const [markAllEmail, setMarkAllEmail] = useState(false)
    const [displayEmailActions, setDisplayEmailActions] = useState(false)
    const [displayingEmailDetails, setDisplayingEmailDetails] = useState(false)
    const [filteredEmails, setFilteredEmails] = useState([])
    const [emailActionSelected, setEmailActionSelected] = useState('inbox')
    const [displaySearch, setDisplaySearch] = useState(false)
    const [searchField, setSearchField] = useState('')
    const [paginationInfo, setPaginationInfo] = useState({})

    const [createEmail, setCreateEmail] = useState(false)
    const [screenSize, setscreenSize] = useState(null)

    const searchRef =  useRef(null)
    const inputSearchRef =  useRef(null)

    useEffect(() => {   
       const items = emails

       items?.forEach(email => {
        email.checked = false
        email.starred = false
       })
       setEmails([...items])

        loadPaginationChange()
    }, [paginationInfo])

    useEffect(() => {
        const screenSize = window.innerWidth
    
        setscreenSize(screenSize)
    
        window.addEventListener('resize', () => {
            setscreenSize(screenSize)
        })
    }, [])

    useOutsideClick(searchRef, () => {
        if (inputSearchRef?.current)  inputSearchRef.current.value = ''
       
        setSearchField('')
        setDisplaySearch(false)
    })

    const handleEmailViewChange = index => {
        const items = emails
        items.forEach(item => item.checked = false)
        setEmails([...items])

        const filtred = emails?.filter(item => item.type === emailActions[index].type || item.starred)?.slice(paginationInfo?.offset, paginationInfo?.offset + paginationInfo?.itemsPerPage)
        setFilteredEmails([...filtred])

        setMarkAllEmail(false)
        setDisplayEmailActions(false)
        setDisplayingEmailDetails(false)
        setCreateEmail(false)

        const actions = emailActions
        setEmailActionSelected(actions[index].type)

        actions.forEach(action => action.active = false)
        actions[index].active = true
        setEmailActions([...actions])
    }

    const markAll = () => {
        if (!filteredEmails.length) return

        const items = emails
        items?.forEach(email => email.checked = !markAllEmail)

        setMarkAllEmail(!markAllEmail)
        setDisplayEmailActions(!markAllEmail)
        setEmails([...items])
    }

    const markEmail = (index, event) => {
        event.stopPropagation()

        const items = filteredEmails
        items[index].checked = !items[index].checked

        setEmails([...items])

        if (!items.every(item => item.checked)) setMarkAllEmail(false)
        if (items.every(item => item.checked)) setMarkAllEmail(true)

        if (!items.some(item => item.checked)) setDisplayEmailActions(false)
        if (items.some(item => item.checked)) setDisplayEmailActions(true)
    }

    const deleteEmail = () => {
        const items = emails

        items.forEach(item => {
            if (item.checked) {
                item.type = 'deleted'
                item.checked = false
            }
        })

        const filtred = items?.filter(item => item.type === emailActionSelected || item.starred)

        setEmails([...items])
        setFilteredEmails([...filtred])
    }

    const handleStarredMark = (id, index, event, starred) => {
        event.stopPropagation()

        const items = emails
        const emailIndex = items.findIndex(item => item.emailId === id)
        items[emailIndex].starred = !starred
        setEmails([...items])

        const filtred = filteredEmails
        filtred[index].starred = !starred
        setFilteredEmails([...filtred])
    }

    const handleSearch = () => {
        const value = inputSearchRef?.current?.value

        if (!value) {
            const filtred = emails?.filter(item => item.type === emailActionSelected || item.starred)
            return setFilteredEmails([...filtred])
        }

        const filtred = filteredEmails?.filter(item => {
            return item.sender.name.toLowerCase().indexOf(value) > -1 || item.subject.toLowerCase().indexOf(value) > -1 || item.message.toLowerCase().indexOf(value) > -1;
        })

        setFilteredEmails([...filtred])
    }

    const clearSearchField = () => {
        inputSearchRef.current.value = ''
        setSearchField('')
        handleSearch()
    }

    const formatDate = value => {
        const date = moment(value)

        const now = moment()

        const difference = now.diff(date, 'days');

        if (difference === 0) return date.format('HH:mm')
        if (difference <= 365) return `${date.format('DD')} de ${date.format('MMM')}`

        return date.format('DD/MM/YYYY')
    }

    const combinesSubjectAndMessage = (subject, message) => `${subject} - ${message}`


    const loadPaginationChange = () => {
        const items = emails?.filter(item => item.type === emailActionSelected || item.starred)

        const slice = items.slice(paginationInfo?.offset, paginationInfo?.offset + paginationInfo?.itemsPerPage)

        setFilteredEmails([...slice])
    }

    return <AppPage title="Email" className={styles['email__container']}>
        <Container>
            <ContainerItem sm={4} md={8} xl={3}>
                <CardContainer className={styles['email__actions']}>
                    <div>
                        <div className={styles['action__compose']}>
                            <Button appearance='primary' isBlock={true} onClick={() => setCreateEmail(true)}>
                                <div className='d-flex align-items-center gap-1'>
                                    <MdOutlineAdd />
                                    {translate('EMAIL.TO_WRITE')}
                                </div>
                            </Button>
                        </div>

                        {emailActions.map((action, index) => (
                            <div key={index} className={`${styles['actions__list']} ${action.active ? styles['actions__list--active'] : ''}`} onClick={() => handleEmailViewChange(index)}>
                                <div className={styles['action__name']}>
                                    <div className='d-flex'>{action.icon}</div>
                                    <div>{action.name}</div>
                                </div>
                            </div>
                        ))}
                    </div>
                </CardContainer>
            </ContainerItem>

            <ContainerItem sm={4} md={8} xl={9}>
                {(!displayingEmailDetails && !createEmail) && <CardContainer className={styles['email__content']}>
                    <div className={styles['email__content__header']}>
                        <div className='d-flex align-items-center gap-2'>
                            <div onClick={markAll} className='u-pointer'>
                                {!markAllEmail && <MdCheckBoxOutlineBlank />}
                                {markAllEmail && <MdCheckBox />}
                            </div> 

                            {!displayEmailActions && <div className='u-pointer'>
                                <MdRefresh />
                            </div>}

                            {!displayEmailActions && <div className='u-relative' ref={searchRef}>
                                <MdSearch className='u-pointer' onClick={() => {setDisplaySearch(!displaySearch); setTimeout(() => {inputSearchRef?.current?.focus()}, 0)}} />

                                {displaySearch && <div className={styles['email__search']}>
                                    <input type="text" value={searchField} placeholder={`${translate('UI.SEARCH')}...`} onChange={(event) => {setSearchField(event.target.value); handleSearch()}} ref={inputSearchRef}/>

                                    {searchField && <MdOutlineClose className={styles['email__search__close']} onClick={() => clearSearchField()} />}
                                </div>}
                            </div>}

                            {(displayEmailActions && filteredEmails.length) && <div className={styles['actions__header']}>
                                <div>
                                    <Tooltip direction='bottom' content={translate('EMAIL.TO_FILE')}>
                                        <MdOutlineArchive />
                                    </Tooltip>
                                </div>
                                <div>
                                    <Tooltip direction='bottom' content={translate('EMAIL.REPORT_SPAM')}>
                                        <MdOutlineReport />
                                    </Tooltip>
                                </div>
                                <div onClick={deleteEmail}>
                                    <Tooltip direction='bottom' content={translate('UI.DELETE')}>
                                        <MdOutlineDeleteOutline />
                                    </Tooltip>
                                </div>
                                <div>
                                    <Tooltip direction='bottom' content={translate('EMAIL.MARK_AS_READ')}>
                                        <MdOutlineDrafts />
                                    </Tooltip>
                                </div>
                                <div>
                                    <Tooltip direction='bottom' content={translate('EMAIL.SUSPEND')}>
                                        <MdAccessTime />
                                    </Tooltip>
                                </div>
                            </div>}
                        </div>

                        <div>
                            <Pagination 
                                options={{
                                    skipPrevious: false,
                                    skipNext: false,
                                    selectQuantity: false
                                }}
                                totalPerPage={15}
                                totalItems={emails?.filter(item => item.type === emailActionSelected || item.starred)?.length}
                                onChangePage={({pagination: info}) => {loadPaginationChange(); setPaginationInfo(info)}}
                            />
                        </div>
                    </div>

                    <div className={styles['email__content__items']}>
                        {filteredEmails?.map((email, index) => (
                            <div key={index} className={`${styles['email__info']} ${email.checked ? styles['email__info--checked'] : ''}`} onClick={() => {setDisplayingEmailDetails(true); setMessageDetail(email)}}>
                                {screenSize > 600 ? <><div className={styles['email__content']}>
                                    <div className='d-flex align-items-center gap-1'>
                                        <div onClick={(event) => markEmail(index, event)}>
                                            {(!email.checked) && <MdCheckBoxOutlineBlank />}
                                            {email.checked && <MdCheckBox />}
                                        </div>
                                        {emailActionSelected !== 'deleted' && <div onClick={(event) => handleStarredMark(email.emailId, index, event, email.starred)}>
                                            {!email.starred && <MdOutlineStarOutline />}
                                            {email.starred && <MdStar style={{ color: '#f7ca4c' }} />}
                                        </div>}
                                    </div>

                                    <div className={styles['email__sender']}>
                                        <div className={styles['sender__name']}>{email.sender.name}</div>
                                    </div>

                                    <div className={styles['email__subject-message']}>
                                        <span style={{ overflow: 'hidden', whiteSpace: 'nowrap', textOverflow: 'ellipsis' }}>{combinesSubjectAndMessage(email.subject, email.message)}</span>
                                    </div>
                                    </div><div className={styles['email__date']}>
                                        {formatDate(email?.date)}
                                    </div>
                                </> : <div className='w-100 d-flex gap-1'>
                                        <Avatar src={email.sender.image} name={email.sender.name}/>
                                        <div className='w-100'>
                                            <div className='d-flex align-items-center justify-content-between'>
                                                <span className='weight-500'>{email.sender.name}</span>
                                                <span>{formatDate(email?.date)}</span>
                                            </div>
                                            <div className='size-13'>{email.subject?.length > 35 ? email.subject?.substr(0, 35) + '...' : email.subject}</div>
                                            <div className='size-13'>{email.message?.length > 35 ? email.message?.substr(0, 35) + '...' : email.message}</div>
                                        </div>
                                    </div>}
                            </div>
                        ))}

                        {!filteredEmails.length && <div className={styles['no__data']}>{translate('EMAIL.NO_DATA_TO_DISPLAY')}</div>}

                    </div>
                </CardContainer>}

                {displayingEmailDetails && <ReadEmail 
                    info={messageDetail}
                    onBack={() => setDisplayingEmailDetails(false)}
                    screenSize={screenSize}
                />}

                {createEmail && <EmailCompose />}
            </ContainerItem>
        </Container>
    </AppPage>
}
