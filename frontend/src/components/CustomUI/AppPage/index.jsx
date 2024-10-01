import React, { useContext, useState } from "react";

import { useTheme } from "../../../hooks/useTheme";
import { ThemeContext } from "../../../contexts/theme";

import Breadcrumbs from "../../BaseUI/Breadcrumbs";
import {
  Drawer,
  DrawerHeader,
  DrawerBody,
  DrawerFooter,
} from "../../BaseUI/Drawer";
import Button from "../../BaseUI/Button";
import ColorSchemeIcon from "./ColorSchemeIcon";

import { MdOutlineSettings } from "react-icons/md";

import "./style.scss";

export default function AppPage({
  title,
  breadcrumbs,
  actions,
  children,
  className,
  onClick,
}) {
  const theme = useTheme();
  const {
    setTheme,
    sidebarTheme,
    setSidebarTheme,
    topMenuTheme,
    setTopMenuTheme,
  } = useContext(ThemeContext);

  const [isOpen, setIsOpen] = useState(false);

  return (
    <div
      className={`app-page-container ${className}`}
      onClick={onClick}
      data-theme={theme}
    >
      <div className="d-flex align-items-end justify-content-between py-4">
        <div className="d-flex flex-column gap-1">
          {Object.keys(breadcrumbs || [])?.length > 0 && (
            <div>
              <Breadcrumbs options={breadcrumbs} />
            </div>
          )}
          <h1
            className={`${theme === "dark" ? "page-label-dark" : "page-label"}`}
          >
            {title}
          </h1>
        </div>

        <div>{actions}</div>
      </div>

      <div className="page-content">{children}</div>

      <div className="setteingtheme-setting" onClick={() => setIsOpen(true)}>
        <MdOutlineSettings />
      </div>

      <Drawer isOpen={isOpen} onClose={() => setIsOpen(false)}>
        <DrawerHeader>Theme Customizer</DrawerHeader>
        <DrawerBody>
          <div className="my-3">
            <p className="weight-500 mb-2 font-16">Color Scheme</p>
            <div className="d-flex align-items-center gap-2">
              <div className="u-pointer">
                <ColorSchemeIcon
                  background="#fff"
                  checked={theme === "light"}
                  onClick={() => setTheme("light")}
                />
              </div>

              <div className="u-pointer">
                <ColorSchemeIcon
                  background="#212734"
                  sidebar="#293042"
                  menu="#212734"
                  checked={theme === "dark"}
                  onClick={() => setTheme("dark")}
                />
              </div>
            </div>
          </div>

          <div className="weight-500 my-3 font-16">
            <p className="weight-500 mb-2 font-16">Sidebar Color</p>
            <div className="d-flex align-items-center gap-2">
              <div className="u-pointer">
                <ColorSchemeIcon
                  checked={sidebarTheme === "light"}
                  onClick={() => setSidebarTheme("light")}
                />
              </div>

              <div className="u-pointer">
                <ColorSchemeIcon
                  sidebar="#293042"
                  checked={sidebarTheme === "dark"}
                  onClick={() => setSidebarTheme("dark")}
                />
              </div>
            </div>
          </div>

          <div className="weight-500 my-3 font-16">
            <p className="weight-500 mb-2 font-16">Topbar Color</p>

            <div className="d-flex align-items-center gap-2">
              <div className="u-pointer">
                <ColorSchemeIcon
                  checked={topMenuTheme === "light"}
                  onClick={() => setTopMenuTheme("light")}
                />
              </div>

              <div className="u-pointer">
                <ColorSchemeIcon
                  menu="#293042"
                  checked={topMenuTheme === "dark"}
                  onClick={() => setTopMenuTheme("dark")}
                />
              </div>
            </div>
          </div>
        </DrawerBody>

        <DrawerFooter>
          <Button onClick={() => setIsOpen(false)}>Close</Button>
        </DrawerFooter>
      </Drawer>
    </div>
  );
}
