import React from "react";
import { useChat } from "../../../../../hooks/useChat";
import { useTheme } from "../../../../../hooks/useTheme";
import Avatar from "../../../Avatar";
import RenderFile from "../RenderFile";

import { extensionGroup } from "../../../../../extensions";

import styles from "./Sender.module.scss";
import { MediaPreview } from "react-view-files";
import VideoPlayer from "../RenderFile/VideoPlayer";
import ImageView from "../RenderFile/ImageView";
import AudioPlayer from "../RenderFile/AudioPlayer";

export default function Sender({ values }) {
    const { chat } = useChat();
    const theme = useTheme();

    const { content, date } = values;
    const { word, pdf, image, video, audio } = extensionGroup;

    const getTime = (value) => {
        const date = new Date(value);

        return `${date.getHours()}:${String(date.getMinutes()).padStart(2, "0")}`;
    };

    const determineClassName = (content) => {
        const hasType = pdf.includes(content?.type) ||  word.includes(content?.type) || image.includes(content?.type) ||  video.includes(content?.type)

        return hasType ? 'sender-container__content__item--no-padding' : ''
    };

    return <div className={`${styles['sender-container']} ${styles[theme]}`}>
        <div className="d-flex align-items-end gap-1">
            <div className={`d-flex align-items-end`}>
                <Avatar image={chat.image} name={chat.name} />
            </div>

            <div className={styles['sender-container__content']}>
                {values?.map((value, index) => (
                    <div
                        className={`${styles['sender-container__content__item']} ${values?.length < 2 && styles['sender-container__content__item--unique']} ${styles[determineClassName(value?.content)]}`}
                        style={{
                            ...((video.includes(value?.type) ||
                                image.includes(value?.type)) && {
                                padding: 0,
                                background: "transparent",
                            }),
                        }}
                        key={index}
                    >                 
                        {typeof value?.content === "string" && <div className={styles['sender-container__content__item--message']}>{value.content}</div>}
                        {typeof value?.content === "object" && <div style={{ position: 'relative' }}>
                            {(pdf.includes(value?.content?.type) ||  word.includes(value?.content?.type)) && 
                                <MediaPreview
                                    file={value.content}
                                    displayFooter={true}
                                    hideDropdown={true}
                                    className={styles["custom-view"]}
                                    style={{
                                        width: "250px",
                                        height: "200px",
                                        backgroundSize: "250px",
                                    }}
                                />
                            }

                            {video.includes(value?.content?.type) && 
                                <VideoPlayer file={value.content} />
                            }

                            {image.includes(value?.content?.type) && 
                                <ImageView file={value.content} />
                            }

                            {audio.includes(value?.content?.type) &&
                                <AudioPlayer file={value.content} className={{buttons: styles['sender-container__content__item--buttons'], progress: styles['sender-container__content__item--progress'], progressInner: styles['sender-container__content__item--progress-inner']}}/>
                            }
                        </div>}
                    </div>
                ))}
            </div>
        </div>

        <div className={styles['sender-container--hour']}>{getTime(values?.[0]?.date)}</div>
    </div>
}
