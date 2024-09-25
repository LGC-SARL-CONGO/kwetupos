import React from "react";

import { MediaPreview } from "../../../MediaView";
import AudioPlayer from "./AudioPlayer";
import VideoPlayer from "./VideoPlayer";
import ImageView from "./ImageView";

import { extensionGroup } from "../../../../../extensions";

import styles from "./RenderFile.module.scss";

export default function RenderFile({ values, date }) {
    const { word, pdf, image, video, audio } = extensionGroup;

    const downloadFile = (file) => {
        const url = file?.url || URL.createObjectURL(file);

        const link = document.createElement("a");
        link.download = file.name;
        link.href = url;
        link.click();

        URL.revokeObjectURL(url);
    };

    return (
        <div className={styles.render__file__container}>
            <div className={styles.file_info}>
                {/* <div className={styles.download__file}>
                    <FileDownloadOutlinedIcon
                        onClick={() => downloadFile(values)}
                    />
                </div> */}

                {values &&
                    (pdf.includes(values?.type) ||
                        word.includes(values?.type)) && (
                        <MediaPreview
                            file={values}
                            displayFooter={true}
                            hideDropdown={true}
                            className={styles["custom-view"]}
                            style={{
                                width: "220px",
                                height: "180px",
                                backgroundSize: "220px",
                            }}
                        />
                    )}

                {values && audio.includes(values?.type) && (
                    <AudioPlayer file={values}/>
                )}
                {values && video.includes(values?.type) && (
                    <VideoPlayer file={values} />
                )}
                {values && image.includes(values?.type) && (
                    <ImageView file={values} />
                )}
            </div>
        </div>
    );
}
