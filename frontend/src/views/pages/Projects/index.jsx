import React from "react";
import { Link } from "react-router-dom";

import { translate } from "../../../hooks/translate";

import { Table, Tr, Td } from "../../../components/BaseUI/Table";
import AppPage from "../../../components/CustomUI/AppPage";
import CardContainer from "../../../components/CustomUI/CardContainer";
import CardInfo from "../../../components/CustomUI/CardInfo";
import Container from "../../../components/CustomUI/Container";
import ContainerItem from "../../../components/CustomUI/Container/ContainerItem";
import AppChart from "../../../components/CustomUI/AppChart";
import Progress from "../../../components/BaseUI/Progress";
import Lozenge from "../../../components/BaseUI/Lozenge";

import { MdOutlineCases } from "react-icons/md";
import { MdCheckCircle } from "react-icons/md";
import { MdHistoryToggleOff } from "react-icons/md";
import { MdMoreTime } from "react-icons/md";
import { MdOutlineCheckCircleOutline } from "react-icons/md";

import boardsJSON from "../../../mocks/boards";

const Projects = () => {
  const breadcrumbs = [{ label: "KwetuPOS", url: "" }, { label: "Projects" }];

  const projects = [
    {
      title: translate("PROJECTS.ACTIVE_PROJECTS"),
      type: "number",
      value: 9,
      icon: <MdOutlineCases />,
    },
    {
      title: translate("PROJECTS.COMPLETED_PROJECTS"),
      type: "number",
      value: 4,
      icon: <MdOutlineCheckCircleOutline />,
      appearance: "success",
    },
    {
      title: translate("PROJECTS.PROJECTS_IN_PROGRESS"),
      type: "number",
      value: 2,
      icon: <MdHistoryToggleOff />,
      appearance: "warning",
    },
    {
      title: translate("PROJECTS.DELAYED_PROJECTS"),
      type: "number",
      value: 3,
      icon: <MdMoreTime />,
      appearance: "danger",
    },
  ];

  const headers = [
    { name: translate("UI.NAME"), resizable: true },
    { name: translate("UI.STATUS"), resizable: true },
    { name: translate("DASHBOARD.ASSIGNED_TO"), resizable: true },
    { name: translate("DASHBOARD.TIME_SPENT"), resizable: true },
  ];

  const tasks = [
    {
      name: "Implement recurring payment module",
      status: "error",
      responsible: "Max Smith",
      timeSpent: "168h 16min",
    },
    {
      name: "Create new login interface",
      status: "success",
      responsible: "Anthony B. Hopkins",
      timeSpent: "48h 0min",
    },
    {
      name: "Plan functionality for extracting reports",
      status: "pending",
      responsible: "Katrina Stambook",
      timeSpent: "78h 27min",
    },
    {
      name: "Add multilingual on the platform",
      status: "success",
      responsible: "Samantha Smith",
      timeSpent: "56h 21min",
    },
    {
      name: "Implement anonymization process in homologation bases",
      status: "pending",
      responsible: "Samantha Smith",
      timeSpent: "56h 21min",
    },
  ];

  const donutChat = {
    series: [1, 2, 4, 7],
    labels: [
      translate("UI.NOT_STARTED"),
      translate("UI.COMPLETEDS"),
      translate("UI.LATES"),
      translate("UI.IN_PROGRESS"),
    ],
    options: {},
  };

  const statusOptions = {
    error: {
      name: translate("UI.OUTDATED"),
      class: "danger-subtle",
    },
    pending: {
      name: translate("UI.IN_PROGRESS"),
      class: "warning-subtle",
    },
    success: {
      name: translate("UI.COMPLETEDS"),
      class: "success-subtle",
    },
  };

  const lifetimeSales = {
    options: {
      xaxis: {
        categories: [
          "Jan",
          "Feb",
          "Mar",
          "Apr",
          "May",
          "Jun",
          "Jul",
          "Aug",
          "Sep",
          "Oct",
          "Nov",
          "Dec",
        ],
        tooltip: {
          enabled: false,
        },
      },
    },
    series: [
      {
        name: "Commits",
        data: [44, 55, 41, 67, 22, 43, 45, 56, 42, 68, 23, 46],
      },
      {
        name: "Pull Requests",
        data: [13, 23, 20, 8, 14, 24, 15, 25, 21, 9, 16, 26],
      },
      {
        name: "Deploys",
        data: [21, 7, 25, 13, 22, 8, 23, 9, 26, 14, 24, 10],
      },
    ],
  };

  const splineAreaChart = {
    options: {
      xaxis: {
        categories: ["Sep", "Oct", "Nov", "Dec", "Jan", "Feb"],
        tooltip: {
          enabled: false,
        },
      },
    },
    series: [
      {
        name: translate("UI.REVENUE"),
        data: [8728.12, 140928.34, 45893.21, 121273.63, 91983.46, 189362.61],
      },
      {
        name: translate("PROJECTS.EXPENSES"),
        data: [1728.12, 45928.34, 7893.21, 4273.63, 18983.46, 65362.61],
      },
    ],
  };

  const filterOPtions = [
    { value: "h", name: translate("UI.TODAY") },
    { value: "w", name: translate("UI.WEEK") },
    { value: "m", name: translate("UI.MONTH") },
    { value: "a", name: translate("UI.YEAR") },
  ];

  return (
    <AppPage title="Projects" breadcrumbs={breadcrumbs}>
      <Container>
        <ContainerItem sm={4} md={4} xl={6}>
          <Container>
            {projects?.map((card, index) => (
              <ContainerItem key={index} sm={4} md={4} xl={6}>
                <CardInfo card={card} appearance={card.appearance} />
              </ContainerItem>
            ))}
          </Container>
        </ContainerItem>

        <ContainerItem sm={4} md={4} xl={6}>
          <AppChart
            title={translate("DASHBOARD.DEVELOPMENT_HISTORY")}
            type={"barStacked"}
            options={lifetimeSales.options}
            series={lifetimeSales.series}
            legend={false}
            height={180}
            colors={["#005FED", "#F5CD47", "#32A877"]}
            filter={filterOPtions}
          />
        </ContainerItem>
      </Container>

      <Container className="mt-3">
        <ContainerItem sm={4} md={8} xl={12}>
          <AppChart
            title={translate("PROJECTS.INCOME_AND_EXPENSES")}
            type={"area"}
            options={splineAreaChart.options}
            series={splineAreaChart.series}
            legend={false}
            direction={"top"}
            alignment={"left"}
            height={300}
            filter={filterOPtions}
            colors={["#36B37F", "#ef7694"]}
            padding={{
              right: 15,
              left: 15,
            }}
          />
        </ContainerItem>
      </Container>

      <Container className="my-3">
        <ContainerItem sm={4} md={4} xl={6}>
          <AppChart
            title={translate("UI.ACTIVITIES")}
            type={"donut"}
            options={donutChat.options}
            series={donutChat.series}
            labels={donutChat.labels}
            legend={true}
            height={240}
            colors={["#C0C6CF", "#3dcf93", "#f3914a", "#ecc634"]}
            direction="right"
            alignment="center"
            filter={filterOPtions}
            roundedMarkers
            verticalMargin={6}
          />
        </ContainerItem>

        <ContainerItem sm={4} md={4} xl={6}>
          <CardContainer
            title={translate("DASHBOARD.PROGRESS_BY_PROJECT")}
            className="px-3 pb-3 d-flex flex-column gap-1"
          >
            <div
              style={{
                position: "absolute",
                top: "16px",
                right: "16px",
                border: "1px solid #D0D5DD",
                borderRadius: "4px",
                padding: "3px 10px",
              }}
            >
              <Link
                to="/dashboard/projects/all"
                style={{
                  fontSize: "13px",
                  color: "#667085",
                  textDecoration: "none",
                }}
              >
                {translate("UI.SEE_ALL")}
              </Link>
            </div>

            {boardsJSON[0].items?.map((board, index) => (
              <div className="d-flex flex-column" key={index}>
                <span className="size-12" style={{ color: "#667085" }}>
                  {board?.category}
                </span>
                <span className="size-14 weight-500">{board?.title}</span>

                <Progress
                  progress={(
                    (board?.completedTasks / board?.totalTasks) *
                    100
                  ).toFixed(0)}
                  showProgress={true}
                  color="#3284ff"
                />
              </div>
            ))}
          </CardContainer>
        </ContainerItem>
      </Container>

      <Container>
        <ContainerItem sm={4} md={8} xl={12}>
          <Table
            title={translate("DASHBOARD.RECENT_ACTIVITIES")}
            columns={headers}
            identifier="projects_tasks"
          >
            {tasks.map((item, index) => (
              <Tr key={index}>
                <Td>{item.name}</Td>
                <Td className="d-flex gap-1">
                  <Lozenge appearance={statusOptions[item.status].class}>
                    {statusOptions[item.status].name}
                  </Lozenge>
                </Td>
                <Td>{item.responsible}</Td>
                <Td>
                  <Lozenge appearance="info-subtle">{item.timeSpent}</Lozenge>
                </Td>
              </Tr>
            ))}
          </Table>
        </ContainerItem>
      </Container>
    </AppPage>
  );
};

export default Projects;
