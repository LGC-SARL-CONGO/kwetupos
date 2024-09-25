import React, { useEffect, useState, useContext } from "react";
import { useTheme } from "../../../hooks/useTheme";
import { ThemeContext } from "../../../contexts/theme";

import Navigation from "./Navigation";

import logoLight from "../../../assets/logos/logo-1.png";
import logoDark from "../../../assets/logos/logo-2.png";
import logoMobileFullTheme from "../../../assets/logos/logo-3.png";

import { MdClose } from "react-icons/md";

import styles from "./Sidebar.module.scss";

const Sidebar = (props) => {
  const theme = useTheme();
  const [logo, setLogo] = useState(null);
  const [logoMobile, setLogoMobile] = useState(null);
  const [toggle, setToggle] = useState(false);

  const { sidebarTheme } = useContext(ThemeContext);

  useEffect(() => {
    setLogo(theme === "dark" || sidebarTheme === "dark" ? logoDark : logoLight);
    setLogoMobile(logoMobileFullTheme);
  }, [theme, sidebarTheme]);

  useEffect(() => {
    setToggle(props?.toggledMenu);
  }, [props?.toggledMenu]);

  return (
    <div
      className={`${styles["sidebar-container"]} ${styles[props?.className]}`}
      ref={props.createRef}
    >
      <div
        className={`${styles["sidebar-container__header"]} ${
          !toggle && styles["sidebar-container__header--reset-justify"]
        }`}
      >
        {!props?.menuMobile && (
          <div className={styles["sidebar-container__header__logo"]}>
            {toggle && (
              <img
                src={logo}
                alt="KwetuPOS"
                width={120}
                className={styles["sidebar-container__header__logo--desktop"]}
              />
            )}
            {!toggle && (
              <img
                src={logoMobile}
                alt="KwetuPOS"
                width={32}
                className={styles["sidebar-container__header__logo--mobile"]}
              />
            )}
          </div>
        )}

        {props?.menuMobile && (
          <div className={styles["sidebar-container__header__mobile"]}>
            <img src={logo} width={120} alt="KwetuPOS" />

            <MdClose
              onClick={props.onClose}
              className={
                styles["sidebar-container__header__mobile--close-sidebar"]
              }
            />
          </div>
        )}
      </div>

      <div
        className={`${styles["sidebar-container__content"]} ${styles["sidebar-container__content--scrollbar"]}`}
      >
        <Navigation
          toggledMenu={props.toggledMenu}
          onClose={({ hasChildrens }) => props.onClose({ hasChildrens })}
        />
      </div>
    </div>
  );
};

export default Sidebar;
