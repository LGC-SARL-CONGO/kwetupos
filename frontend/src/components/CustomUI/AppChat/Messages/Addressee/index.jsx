import React from "react";
import { useTheme } from "../../../../../hooks/useTheme";
import Avatar from "../../../Avatar";

import styles from "./Addressee.module.scss";

import beatriz from "../../../../../assets/users/beatriz.jpg";

import { extensionGroup } from "../../../../../extensions";
import AudioPlayer from "../RenderFile/AudioPlayer";
import VideoPlayer from "../RenderFile/VideoPlayer";
import { MediaPreview } from "react-view-files";
import ImageView from "../RenderFile/ImageView";

export default function Addressee({ values }) {
    const theme = useTheme();

    const { word, pdf, image, video, audio } = extensionGroup;
  
    const getTime = (value) => {
        const date = new Date(value);

        return `${date.getHours()}:${String(date.getMinutes()).padStart(2, "0")}`;
    };

    const determineClassName = (content) => {
        const hasType = pdf.includes(content?.type) ||  word.includes(content?.type) || image.includes(content?.type) ||  video.includes(content?.type)

        return hasType ? 'addressee-container__content__item--no-padding' : ''
    };

    return <div className={`${styles['addressee-container']} ${styles[theme]}`}>
        <div className="d-flex align-items-end justify-content-end gap-1">
            <div className={styles['addressee-container__content']}>
                {values?.map((value, index) => (
                    <div
                        className={`${styles['addressee-container__content__item']} ${values?.length < 2 && styles['addressee-container__content__item--unique']} ${styles[determineClassName(value?.content)]}`}
                        style={{
                            ...((video.includes(value?.type) ||
                                image.includes(value?.type)) && {
                                padding: 0,
                                background: "transparent",
                            }),
                        }}
                        key={index}
                    >                 
                        {typeof value?.content === "string" && <div className={styles['addressee-container__content__item--message']}>{value.content}</div>}
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
                                <AudioPlayer file={value.content} className={{buttons: styles['addressee-container__content__item--buttons'], progress: styles['addressee-container__content__item--progress'], progressInner: styles['addressee-container__content__item--progress-inner']}}/>
                            }
                        </div>}
                    </div>
                ))}
            </div>

            <div className={`d-flex align-items-end`}>
                <Avatar src={beatriz} name={"Beatriz"} />
            </div>
        </div>

        <div className={styles['addressee-container--hour']}>{getTime(values?.[0]?.date)}</div>
    </div>
}
