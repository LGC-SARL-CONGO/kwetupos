import React, { useState, useContext, useRef } from "react";

import UserDropdown from "../../CustomUI/UserDropdown";
import Search from "../../CustomUI/Search";

import { ThemeContext } from "../../../contexts/theme";
import useOutsideClick from "../../../useOut";

import styles from "./AppHeader.module.scss";

import { MdOutlineDarkMode } from "react-icons/md";
import { MdOutlineLightMode } from "react-icons/md";
import { HiMenuAlt1 } from "react-icons/hi";
import { MdOutlineSearch } from "react-icons/md";

import Notifications from "./Notifications";
import Languages from "./Languages";

const AppHeader = ({ toggleMenu, toggleMenuMobile }) => {
    const [displayMobileSearch, setDisplayMobileSearch] = useState(false);

    const { theme, setTheme } = useContext(ThemeContext);

    const searchRef = useRef(null);

    const notifications = [
        {
            user: "Carolina Ferreira",
            subject: "Generate Reactjs Hooks for Wix",
            date: "2023-10-14 10:15:21",
        },
        {
            user: "Jennyfer Whatson",
            subject: "You were mentioned in a Figma task",
            date: "2023-10-13 17:32:11",
        },
        {
            user: "System",
            subject: 'The "Learn Git" project ends today',
            date: "2023-10-10 11:00:00",
        },
        {
            user: "Laura Lima",
            subject:
                "Requested submission of attachments for the system redesign task",
            date: "2023-10-01 08:44:21",
        },
    ];

    useOutsideClick(searchRef, () => {
        setDisplayMobileSearch(false);
    });

    return (
        <>
            <div
                className={`${styles['header-container']} ${
                    styles[global.config.theme]
                }`}
            >
                <div className={styles["header-container__desktop"]}>
                    <div className="d-flex align-items-center justify-content-between">
                        <div className={`d-flex align-items-center gap-3`}>
                            <HiMenuAlt1
                                className={`${styles.menu__icon} u-pointer`}
                                onClick={() => {toggleMenu(); window.dispatchEvent(new Event('resize'))}}
                            />

                            <Search className={styles["header-container__desktop--search"]} />
                        </div>

                        <div className={`${styles['header-container__desktop--options']}`}>
                            <Languages />

                            <Notifications values={notifications} />

                            <div
                                className="u-pointer d-flex align-items-center"
                                onClick={() =>
                                    setTheme(
                                        theme === "light" ? "dark" : "light"
                                    )
                                }
                            >
                                {theme === "light" && <MdOutlineDarkMode />}
                                {theme === "dark" && <MdOutlineLightMode />}
                            </div>

                            <UserDropdown />
                        </div>
                    </div>
                </div>

                <div className={styles["header-container__mobile"]}>
                    <div className="d-flex align-items-center justify-content-between">
                        <HiMenuAlt1
                            className={styles["header-container__mobile--icon"]}
                            onClick={() => {toggleMenuMobile(); window.dispatchEvent(new Event('resize'))}}
                        />

                        <div className={styles["header-mobile"]}>
                            <div className={styles["header-mobile__items"]}>
                                <div className="d-flex" ref={searchRef}>
                                    <MdOutlineSearch
                                        onClick={() =>
                                            setDisplayMobileSearch(
                                                !displayMobileSearch
                                            )
                                        }
                                        className={styles["header-mobile__items--icon"]}
                                    />

                                    {displayMobileSearch && (
                                        <div
                                            className={styles["header-mobile__items--search"]}
                                        >
                                            <input
                                                type="text"
                                                placeholder={"Search..."}
                                                className={styles["header-mobile__items--search--input"]}
                                            />
                                        </div>
                                    )}
                                </div>

                                <Languages />

                                <Notifications values={notifications} />

                                <div
                                    className="u-pointer d-flex align-items-center"
                                    onClick={() =>
                                        setTheme(
                                            theme === "light" ? "dark" : "light"
                                        )
                                    }
                                >
                                    {theme === "light" && (
                                        <MdOutlineDarkMode />
                                    )}
                                    {theme === "dark" && (
                                        <MdOutlineLightMode />
                                    )}
                                </div>

                                <UserDropdown hideName={true} size="2rem" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};

export default AppHeader;
