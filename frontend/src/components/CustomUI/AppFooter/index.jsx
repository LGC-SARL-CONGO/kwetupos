import React from "react";
import moment from "moment";

import styles from "./AppFooter.module.scss";

export default function AppFooter() {
  return (
    <div className={`${styles["app-footer-container"]}`}>
      <p className="size-14">
        Copyright &copy; {moment().year()}{" "}
        <span className="bold">KwetuPOS</span>
      </p>
    </div>
  );
}
