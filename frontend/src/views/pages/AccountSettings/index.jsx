import React, { useState } from "react";

import { translate } from "../../../hooks/translate";

import AppPage from "../../../components/CustomUI/AppPage";
import Container from "../../../components/CustomUI/Container";
import ContainerItem from "../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../components/BaseUI//Checkbox";
import Sidebar from "./Sidebar";
import BasicInformation from "./BasicInformation";
import Preferences from "./Preferences";
import Security from "./Security";
import RecentDevices from "./RecentDevices";
import Notifications from "./Notifications";
import Button from "../../../components/BaseUI/Button";

import "./AccountSettings.scss";

export default function AccountSettings() {
  const [breadcrumbs, setBreadcrumbs] = useState([
    { label: "KwetuPOS", url: "" },
    { label: translate("ACCOUNT_SETTINGS.TITLE"), url: "" },
    { label: translate("ACCOUNT_SETTINGS.BASIC_INFORMATION") },
  ]);
  const [currentView, setCurrentView] = useState(
    translate("ACCOUNT_SETTINGS.BASIC_INFORMATION")
  );

  const changeBreadcrumb = (value) => {
    const updatedBreadcrumbs = [...breadcrumbs];
    updatedBreadcrumbs[updatedBreadcrumbs.length - 1].label = value;
    setBreadcrumbs(updatedBreadcrumbs);
    setCurrentView(value);
  };

  return (
    <AppPage
      title={currentView}
      className="account-settings-container"
      breadcrumbs={breadcrumbs}
    >
      <Container>
        <ContainerItem sm={4} md={4} xl={3}>
          <Sidebar onChange={(value) => changeBreadcrumb(value)} />
        </ContainerItem>
        <ContainerItem sm={4} md={4} xl={9}>
          {currentView === translate("ACCOUNT_SETTINGS.BASIC_INFORMATION") && (
            <BasicInformation />
          )}
          {currentView === translate("ACCOUNT_SETTINGS.PREFERENCES") && (
            <Preferences />
          )}
          {currentView === translate("ACCOUNT_SETTINGS.SECURITY") && (
            <Security />
          )}
          {currentView === translate("ACCOUNT_SETTINGS.RECENT_DEVICES") && (
            <RecentDevices />
          )}
          {currentView === translate("ACCOUNT_SETTINGS.NOTIFICATIONS") && (
            <Notifications />
          )}
          {currentView === translate("ACCOUNT_SETTINGS.DELETE_ACCOUNT") && (
            <div className="account-settings-container__basic-information">
              <h4>{translate("ACCOUNT_SETTINGS.DELETE_YOUR_ACCOUNT")}</h4>
              <p className="mt-3 mb-5">
                {translate("ACCOUNT_SETTINGS.DELETE_YOUR_ACCOUNT")}
              </p>

              <Checkbox
                label={translate(
                  "ACCOUNT_SETTINGS.ACCOUNT_DELETION_CONFIRMATION"
                )}
              />

              <div className="py-2"></div>

              <Button appearance="danger">
                {translate("ACCOUNT_SETTINGS.DELETE_ACCOUNT")}
              </Button>
            </div>
          )}
        </ContainerItem>
      </Container>
    </AppPage>
  );
}
