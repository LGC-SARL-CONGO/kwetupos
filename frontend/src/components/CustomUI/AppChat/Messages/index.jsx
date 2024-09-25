import React, { useState, useRef, useCallback, useEffect } from "react";
import EmojiPicker from "emoji-picker-react";
import moment from "moment";
import { useChat } from "../../../../hooks/useChat";
import { translate } from "../../../../hooks/translate";

import useOutsideClick from "../../../../useOut";

import Sender from "./Sender";
import Addressee from "./Addressee";
import Avatar from "../../Avatar";
import { MediaPreview } from "../../MediaView";
import Button from "../../../BaseUI/Button";

import { MdClose } from "react-icons/md";
import { MdSearch } from "react-icons/md";
import { MdOutlineVideocam } from "react-icons/md";
import { MdOutlineCall } from "react-icons/md";
import { MdOutlineMood } from "react-icons/md";
import { MdOutlineMicNone } from "react-icons/md";
import { MdOutlineAttachFile } from "react-icons/md";
import { MdArrowBack } from "react-icons/md";

import fetchMessages from "../../../../messages.json";

import styles from "./Messages.module.scss";

export default function Messages({ onBack }) {
    const { chat } = useChat();

    const [user, setUser] = useState({});

    const [messages, setMessages] = useState([]);
    const [previewFile, setPreviewFile] = useState();
    const [currentPreview, setCurrentPreview] = useState();

    const [showEmojiPicker, setShowEmojiPicker] = useState(false);
    const [newMessage, setNewMessage] = useState({
        content: "",
        date: "",
        type: "addressee",
    });
    const [cursorPosition, setCursorPosition] = useState(null);
    const [textarea, setTextarea] = useState({
        rows: 1,
        min: 1,
        max: 12,
    });

    const [height, setHeight] = useState(491)

    const emojiRef = useRef(null);
    const emojiPickerRef = useRef(null);
    const messageContainerRef = useRef(null);

    useEffect(() => {
        setUser({ ...chat });
        setMessages(fetchMessages[chat.id] || []);
        setTimeout(() => scrollToBottom(), 1);
    }, [chat]);

    useEffect(() => {
        const contactsContainer = document.getElementById('contacts-container');

        const handleResize = () => {
            if (contactsContainer) {
                setHeight(contactsContainer.clientHeight);
            }
        };

        window.addEventListener('resize', handleResize);

        handleResize();

        return () => {
            window.removeEventListener('resize', handleResize);
        };
    }, []);

    useOutsideClick(emojiRef, () => {
        setShowEmojiPicker(false);
    });

    const getEmoji = (event) => {
        handleChangeEmoji(event.emoji);
    };

    const insertAt = (target, newString, pos) => {
        if (typeof pos == "undefined") pos = 0;
        if (typeof newString == "undefined") newString = "";

        return target.slice(0, pos) + newString + target.slice(pos);
    };

    const handleClickInput = useCallback(
        (e) => setCursorPosition(e.target.selectionStart),
        []
    );

    const handleChangeEmoji = useCallback(
        (emoji) => {
            const getValue = insertAt(
                newMessage.content,
                emoji,
                cursorPosition
            );

            setNewMessage({ ...newMessage, content: getValue });
        },
        [cursorPosition, newMessage]
    );

    const handleMessageTimeUpdate = () =>
        setNewMessage({
            ...newMessage,
            date: moment().format("YYYY-MM-DD H:m:s"),
    });

    const handleSendingMessage = () => {
        if (newMessage.content === "") return;

        setMessages([...messages, newMessage]);
        setNewMessage({ content: "", date: "", type: "addressee" });
        setTextarea({ ...textarea, rows: 1 });
    };

    const handleTextAreaAutoHeight = (event) => {
        const lineHeight = 24;
        const { min, max } = textarea;

        const previous = event.target.rows;
        event.target.rows = min;

        const current = ~~(event.target?.scrollHeight / lineHeight);

        if (current === previous) {
            event.target.rows = current;
        }

        if (current >= max) {
            event.target.rows = max;
            event.target.scrollTop = event.target?.scrollHeight;
        }

        setTextarea({ ...textarea, rows: current < max ? current : max });
    };

    const scrollToBottom = () => {
        const container = messageContainerRef?.current

        if (container) container.scrollTop = container?.scrollHeight - container.clientHeight
    }

    const uploadFile = () => document.getElementById("uploadFile").click();

    const handleFileSelection = (files) => {
        setPreviewFile([...files]);
        setCurrentPreview(files[0]);
    };

    const handleFileUploadUnsubscribe = () => {};

    const handleFileUpload = () => {
        const fileMessage = [];

        previewFile?.forEach((preview) => {
            fileMessage.push({
                content: preview,
                date: moment().format("YYYY-MM-DD H:m:s"),
                type: "addressee",
            });
        });

        setMessages([...messages, ...fileMessage]);

        setPreviewFile(null);
    };

    function groupMessages(messages) {
        let groupedMessages = [];
        let currentGroup = { type: '', messages: [] };
    
        messages.forEach((message, index) => {
            if (index === 0) {
                currentGroup.type = message.type;
                currentGroup.messages.push(message);
            } else {
                const prevMessage = messages[index - 1];
                const currentTime = new Date(message.date);
                const prevTime = new Date(prevMessage.date);
                const diffInMinutes = (currentTime - prevTime) / 1000 / 60;
    
                if (message.type === prevMessage.type && diffInMinutes <= 1) {
                    currentGroup.messages.push(message);
                } else {
                    groupedMessages.push(currentGroup);
                    currentGroup = { type: message.type, messages: [message] };
                }
            }
        });
    
        if (currentGroup.messages.length > 0) {
            groupedMessages.push(currentGroup);
        }
    
        return groupedMessages;
    }
    

    const groupedMessages = groupMessages(messages);

    return (
        <>
            {user?.name && (
                <>
                    <div
                        className={styles['messages-container']}
                        style={{ height: `${height}px` }}
                    >
                        <div className={styles['messages-container__header']}>
                            <div className="d-flex align-items-center gap-1">
                                <div
                                    className={styles['messages-container__header--back-icon']}
                                    onClick={() => onBack?.()}
                                >
                                    <MdArrowBack />
                                </div>

                                <Avatar
                                    image={user?.image}
                                    name={user?.name}
                                />

                                <div className="d-flex flex-column">
                                    <span className={styles['messages-container__header--username']}>
                                        {user?.name}
                                    </span>
                                    <span className={styles['messages-container__header--status']}>
                                        {user?.online ? "online" : "offline"}
                                    </span>
                                </div>
                            </div>

                            <div className={styles['messages-container__header__actions']}>
                                <MdSearch />
                                <MdOutlineCall />
                                <MdOutlineVideocam />
                            </div>
                        </div>
                        
                        <div className={styles['messages-container__content']} ref={messageContainerRef}>
                            {groupedMessages.map((group, index) => (
                                <div key={index}>
                                    {group?.type === "sender" && (
                                        <Sender values={group?.messages} />
                                    )}
                                    {group.type === "addressee" && (
                                        <Addressee values={group?.messages} />
                                    )}
                                </div>
                            ))}
                        </div>

                        {showEmojiPicker && (
                            <div
                                className={styles.emoji__custom}
                                ref={emojiRef}
                            >
                                <EmojiPicker
                                    width={300}
                                    height={350}
                                    searchDisabled={true}
                                    onEmojiClick={(event) => getEmoji(event)}
                                    previewConfig={{ showPreview: false }}
                                    className={styles["emoji__content"]}
                                />
                            </div>
                        )}

                        {previewFile && (
                            <div className={styles.preview__file}>
                                <div
                                    className={styles["preview__header"]}
                                    onClick={handleFileUploadUnsubscribe}
                                >
                                    <div
                                        className={styles["close__file"]}
                                        onClick={() => setPreviewFile(null)}
                                    >
                                        <MdClose />
                                    </div>
                                    <div>{currentPreview?.name}</div>
                                    <div></div>
                                </div>

                                <div className={styles["preview__content"]}>
                                    <MediaPreview
                                        file={currentPreview}
                                        hideFooter={true}
                                        className={
                                            styles[
                                                "preview__content__custom-view"
                                            ]
                                        }
                                        style={{
                                            width: "413px",
                                            height: "292px",
                                        }}
                                    />
                                </div>

                                <div className={styles["preview__footer"]}>
                                    <div
                                        style={{
                                            borderRadius: "4px",
                                            display: "flex",
                                            gap: "15px",
                                            paddingTop: "16px"
                                        }}
                                    >
                                        {previewFile?.length > 1 ? <div
                                            style={{
                                                border: "1.5px solid #0acf97",
                                                borderRadius: "4px",
                                                position: "relative",
                                                padding: "5px 12px",
                                                fontWeight: '500'
                                            }}
                                        >
                                            <span>+{previewFile?.length - 1}</span>
                                        </div>  : <></>}
                                    </div>

                                    <div className={styles.upload__file}>
                                        <Button
                                            title={translate("UI.SEND")}
                                            appearance='primary'
                                            onClick={handleFileUpload}
                                        />
                                    </div>
                                </div>
                            </div>
                        )}

                        {!previewFile && (
                            <div className={styles.input__message}>
                                <div className={styles.form__message}>
                                    <input
                                        type="file"
                                        name="uploadFile"
                                        id="uploadFile"
                                        hidden
                                        accept="image/*,video/*,audio/*,.pdf,.doc,.docx,.txt"
                                        multiple
                                        onChange={(e) =>
                                            handleFileSelection(e.target.files)
                                        }
                                    />

                                    <MdOutlineMood
                                        className={styles["form__emoji"]}
                                        onClick={() => setShowEmojiPicker(true)}
                                        style={{ fontSize: '22px' }}
                                    />

                                    <textarea
                                        placeholder={translate(
                                            "CHAT.TYPE_MESSAGE"
                                        )}
                                        className={styles.input}
                                        rows={textarea.rows}
                                        value={newMessage.content}
                                        onChange={(e) => {
                                            setNewMessage({
                                                ...newMessage,
                                                content: e.target.value,
                                            });
                                            handleTextAreaAutoHeight(e);
                                        }}
                                        onClick={handleClickInput}
                                        onBlur={(e) => {
                                            handleClickInput(e);
                                            handleMessageTimeUpdate();
                                        }}
                                    />

                                    {!newMessage.content && (
                                        <div
                                            className={styles.actions__message}
                                        >
                                            <MdOutlineMicNone />
                                            <MdOutlineAttachFile
                                                onClick={() => uploadFile()}
                                            />
                                        </div>
                                    )}

                                    {newMessage.content && (
                                        <div
                                            className={styles["form__send"]}
                                            onClick={handleSendingMessage}
                                        >
                                            {translate("UI.SEND")}
                                        </div>
                                    )}
                                </div>
                            </div>
                        )}
                    </div>
                </>
            )}

            {!user.name && (
                <div className={styles['empty__container']} style={{ height: `${height}px` }}>
                    <div className={styles.informations}>
                        <img
                            src={require("../../../../assets/extras/chat.png")}
                            alt="Chat"
                            className={styles.chat__image}
                        />
                        <span className={styles.title}>
                            {translate("CHAT.SELECT_A_CONVERSATION")}
                        </span>
                    </div>
                </div>
            )}
        </>
    );
}
