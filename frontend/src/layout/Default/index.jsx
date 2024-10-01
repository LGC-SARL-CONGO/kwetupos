import React, { useState, useEffect, useRef, useContext } from "react";
import { useTheme } from "../../hooks/useTheme";
import { ThemeContext } from "../../contexts/theme";
import { useLocation } from "react-router-dom"; // Importando o hook useLocation do React Router
import AppContent from "../../components/CustomUI/AppContent";
import AppFooter from "../../components/CustomUI/AppFooter";
import AppHeader from "../../components/CustomUI/AppHeader";
import Sidebar from "../../components/CustomUI/Sidebar";
import styles from "./Default.module.scss";

const Default = () => {
  const theme = useTheme();
  const { sidebarTheme, topMenuTheme } = useContext(ThemeContext);

  const [openMenu, setOpenMenu] = useState(true);
  const [openMenuMobile, setOpenMenuMobile] = useState(false);
  const [hideFooter, setHideFooter] = useState(false);

  const containerRef = useRef(null);
  const sidebarRef = useRef(null);
  const paretSidebarRef = useRef(null);
  const overlayRef = useRef(null);

  const location = useLocation();

  useEffect(() => {
    const sidebar = sidebarRef?.current;
    const overlay = overlayRef?.current;

    if (openMenuMobile && window.innerWidth < 992) {
      paretSidebarRef.current.style.zIndex = 50;
      sidebar.classList.add(`${styles["sidebar__sm__md"]}`);
      overlay.classList.add(`${styles["overlay__container"]}`);
    } else {
      paretSidebarRef.current.style.zIndex = 20;
      sidebar.classList.remove(`${styles["sidebar__sm__md"]}`);
      overlay.classList.remove(`${styles["overlay__container"]}`);
    }
  }, [openMenuMobile]);

  useEffect(() => {
    if (window.innerWidth > 992) {
      window.addEventListener("resize", () => setOpenMenuMobile(false));
    }
  }, []);

  useEffect(() => {
    const routeName = location.pathname;

    if (routeName === "/dashboard/email") {
      setHideFooter(true);
    } else {
      setHideFooter(false);
    }
  }, [location.pathname]);

  const onChildChanged = () => {
    setOpenMenu(!openMenu);
  };

  return (
    <div
      className={`${styles.default__container} ${styles[theme]}`}
      ref={containerRef}
      data-theme={theme}
      data-sidebar-theme={sidebarTheme}
      data-top-menu-theme={topMenuTheme}
    >
      <div
        className={`${styles.default__sidebar} ${
          !openMenu ? `${styles.mobile__sidebar}` : ""
        } ${styles[theme]}`}
        ref={paretSidebarRef}
      >
        <Sidebar
          createRef={sidebarRef}
          toggledMenu={openMenu}
          menuMobile={openMenuMobile}
          className={openMenuMobile ? "sidebar__sm__md" : ""}
          onClose={({ hasChildrens }) =>
            setOpenMenuMobile(hasChildrens ? true : false)
          }
        />
      </div>
      <div
        className={`${styles.default__main} ${
          !openMenu ? `${styles.mobile__main}` : ""
        } ${theme === "dark" ? `${styles.dark}` : ""}`}
        id="default-main"
      >
        <div>
          <AppHeader
            toggleMenu={() => onChildChanged()}
            toggleMenuMobile={() => {
              setOpenMenuMobile(!openMenuMobile);
            }}
          />
          <AppContent />
        </div>
        {!hideFooter && (
          <div>
            <AppFooter />
          </div>
        )}
      </div>
      <div ref={overlayRef}></div>
    </div>
  );
};

export default Default;
