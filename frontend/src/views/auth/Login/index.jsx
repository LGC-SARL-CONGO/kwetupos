import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

import { useAuth } from "../../../services/useAuth";
import { translate } from "../../../hooks/translate";

import Input from "../../../components/BaseUI/Input";
import Button from "../../../components/BaseUI/Button";
import Content from "../Content";

import styles from "./Login.module.scss";
import { useTitle } from "../../../hooks/useTitle";
import Alert from "../../../components/BaseUI/Alert";

export default function Login() {
  useTitle("Login | Magnun - React Admin Template");

  const navigate = useNavigate();
  const { login } = useAuth();

  const [user, setUser] = useState({
    email: "",
    password: "",
  });

  const [hasError, setHasError] = useState(false);

  const signin = async () => {
    const response = await login(user.email, user.password);
    if (response) navigate("/dashboard", { replace: true });
    else setHasError(true);
  };

  return (
    <div className={styles["login-container"]}>
      <Content title={translate("AUTHENTICATION.ENTER_TO_CONTINUE")}>
        {hasError && (
          <Alert
            type="alert-danger"
            className="mt-3"
            dismiss={true}
            onClose={() => setHasError(false)}
          >
            {translate("AUTHENTICATION.INCORRECT_USERNAME_OR_PASSWORD")}
          </Alert>
        )}

        <div className="mt-4">
          <Input
            type="email"
            label="Email"
            placeholder={translate("AUTHENTICATION.ENTER_YOUR_EMAIL")}
            className={styles["custom__input"]}
            value={user.email}
            onChange={(value) => setUser({ ...user, email: value })}
          />

          <Input
            type="password"
            label={translate("AUTHENTICATION.PASSWORD")}
            placeholder={translate("AUTHENTICATION.ENTER_YOUR_PASSWORD")}
            className={styles["custom__input"]}
            value={user.password}
            onChange={(value) => setUser({ ...user, password: value })}
          />
        </div>

        <div className={styles["forgot__password"]}>
          <span>{translate("AUTHENTICATION.FORGOT_YOUR_PASSWORD")}</span>
        </div>

        <div className="mt-2">
          <Button
            title={translate("AUTHENTICATION.TO_ENTER")}
            appearance="primary"
            isBlock={true}
            onClick={signin}
          />
        </div>

        <div className={styles["social__login"]}>
          <div className={styles["divider"]}>
            <span className={styles["line"]}></span>
            <span>{translate("AUTHENTICATION.OR")}</span>
            <span className={styles["line"]}></span>
          </div>

          <div className={styles["logins"]}>
            <div className={styles["google"]}>
              <img
                src={require("../../../assets/icons/google.png")}
                alt="Google"
              />
              <span>Google</span>
            </div>

            <div className={styles["microsoft"]}>
              <img
                src={require("../../../assets/icons/microsoft.png")}
                alt="Microsoft"
              />
              <span>Microsoft</span>
            </div>
          </div>
        </div>

        <div className={styles["register"]}>
          <span>{translate("AUTHENTICATION.DONT_HAVE_AN_ACCOUNT")}</span>
          <span
            className={styles["create__account"]}
            onClick={() => navigate("/register")}
          >
            {translate("AUTHENTICATION.REGISTER")}
          </span>
        </div>
      </Content>
    </div>
  );
}
