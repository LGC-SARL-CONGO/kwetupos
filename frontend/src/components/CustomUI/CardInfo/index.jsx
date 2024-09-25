import React from "react";

import { useFormatValue } from "../../../hooks/useFormatValue";

import { MdOutlineTrendingDown } from "react-icons/md";
import { MdOutlineTrendingUp } from "react-icons/md";

import styles from "./CardInfo.module.scss";

export default function CardInfo({ card, appearance }) {
    const format = useFormatValue;

    return (
        <div className={styles['card-info-container']}>
            <div className={styles['card-info-container__item']}>
                <div className="d-flex align-items-center">
                    {card.icon && (
                        <div className={`${styles['card-info-container__item--icon']} ${styles[`card-info-container__item--icon--${appearance || 'primary'}`]}`}>
                            {card.icon}
                        </div>
                    )}

                    <div className={styles['card-info-container__item--title']} title={card?.title}>{card.title}</div>
                </div>

                <div className={styles['card-info-container__item__content']}>
                    <div className={styles['card-info-container__item__content--value']}>
                        {format(card?.value, card?.type)}
                    </div>

                    {card?.percentage && (
                        <span
                            className={`${styles['card-info-container__item__content--rate']} ${
                                card.percentage < 0
                                    ? styles["card-info-container__item__content--rate--negative"]
                                    : styles["card-info-container__item__content--rate--positive"]
                            }`}
                        >
                            {card.percentage < 0 ? (
                                <MdOutlineTrendingDown />
                            ) : (
                                <MdOutlineTrendingUp />
                            )}
                            <span>{card.percentage}%</span>
                        </span>
                    )}
                </div>
            </div>
        </div>
    );
}
