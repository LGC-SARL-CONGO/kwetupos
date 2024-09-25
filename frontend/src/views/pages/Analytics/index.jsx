import React from "react";

import useTranslate from "../../../hooks/useTranslate";
import { useFormatValue } from "../../../hooks/useFormatValue";

import AppPage from "../../../components/CustomUI/AppPage";
import Container from "../../../components/CustomUI/Container";
import ContainerItem from "../../../components/CustomUI/Container/ContainerItem";
import AppChart from "../../../components/CustomUI/AppChart";
import CardInfoAnalytic from "../../../components/CustomUI/CardInfoAnalytic";
import Progress from "../../../components/BaseUI/Progress";
import Maps from "../../../components/CustomUI/Maps";

import styles from "./Analytics.module.scss";

const Analytics = () => {
  const formatValue = useFormatValue;

  const breadcrumbs = [{ label: "KwetuPOS", url: "" }, { label: "Analytics" }];

  const splineAreaChart = {
    options: {
      xaxis: {
        categories: ["Set", "Out", "Nov", "Dec", "Jan", "Fev"],
        tooltip: {
          enabled: false,
        },
      },
    },
    series: [
      {
        name: useTranslate("UI.SALES"),
        data: [4000, 4500, 4300, 4800, 4600, 5600],
      },
      {
        name: useTranslate("UI.REVENUE"),
        data: [2000, 3500, 5300, 4600, 4800, 5200],
      },
    ],
  };

  const netIncome = {
    title: useTranslate("UI.USERS"),
    currentValue: 34827,
    previousValue: 27489,
    chart: "multiBar",
    type: "number",
    options: {
      xaxis: {
        categories: ["Sep", "Oct", "Nov", "Dec", "Jan", "Feb"],
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },

        axisTicks: {
          show: false,
        },
        labels: {
          show: false,
        },
      },
    },
    series: [
      {
        name: useTranslate("UI.PLURAL_ACTIVE"),
        data: [3800, 2400, 4600, 1000, 3300, 2200],
      },
      {
        name: useTranslate("UI.PLURAL_INACTIVE"),
        data: [480, 167, 78, 120, 478, 198],
      },
    ],
    colors: ["#32A877", "#DEE0E5"],
  };

  const totalRevenue = {
    title: useTranslate("UI.VISITORS"),
    currentValue: 29283,
    previousValue: 29012,
    chart: "area",
    type: "number",
    options: {
      xaxis: {
        categories: ["Sep", "Oct", "Nov", "Dec", "Jan", "Feb"],
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },

        axisTicks: {
          show: false,
        },
        labels: {
          show: false,
        },
      },
    },
    series: [
      {
        name: useTranslate("UI.REVENUE"),
        data: [2000, 3300, 2200, 3800, 2400, 4600],
      },
    ],
    colors: ["#57D9A4"],
  };

  const totalPuchasement = {
    title: useTranslate("DASHBOARD.CONVERSATION_VERSES_REJECTION"),
    currentValue: 8.76,
    previousValue: 6.25,
    chart: "area",
    type: "percentage",
    options: {
      xaxis: {
        categories: ["Sep", "Oct", "Nov", "Dec", "Jan", "Feb"],
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },

        axisTicks: {
          show: false,
        },
        labels: {
          show: false,
        },
      },
    },
    series: [
      {
        name: useTranslate("DASHBOARD.CONVERSION"),
        data: [200, 330, 220, 380, 240, 460],
      },
      {
        name: useTranslate("DASHBOARD.REJECTION"),
        data: [67, 41, 242, 176, 76, 210],
      },
    ],
    colors: ["#ef7694", "#a456d3"],
  };

  const totalPuchasement2 = {
    title: useTranslate("DASHBOARD.REVENUE_PER_DEVICE"),
    currentValue: 29283,
    previousValue: 30489,
    chart: "barStacked",
    type: "number",
    options: {
      xaxis: {
        categories: ["Sep", "Oct", "Nov", "Dec", "Jan", "Feb", "Mar", "Apr"],
        tooltip: {
          enabled: false,
        },
        axisBorder: {
          show: false,
        },

        axisTicks: {
          show: false,
        },
        labels: {
          show: false,
        },
      },
    },
    series: [
      {
        name: "Desktop",
        data: [30, 40, 26, 77, 28, 139, 102, 56],
      },
      {
        name: "Mobile",
        data: [16, 60, 68, 130, 45, 210, 167, 71],
      },
      {
        name: "Tablet",
        data: [12, 19, 7, 32, 11, 87, 44, 23],
      },
    ],
    colors: ["#FF8B01", "#ef7496", "#36B37F"],
  };

  const salesByRegion = [
    { name: useTranslate("COUNTRIES.CHINA"), quantity: 1890 },
    { name: useTranslate("COUNTRIES.FRANCE"), quantity: 1320 },
    { name: useTranslate("COUNTRIES.ARGENTINA"), quantity: 1293 },
    { name: useTranslate("COUNTRIES.BRAZIL"), quantity: 920 },
    { name: useTranslate("COUNTRIES.UNITED_STATE"), quantity: 901 },
  ];

  const radialChart = {
    series: [58],
    options: {
      labels: ["Iphone X"],
    },
    colors: ["#524cff"],
  };

  const chartMap = {
    series: {
      regions: [
        {
          values: {
            CN: 1890,
            FR: 1320,
            AR: 1293,
            BR: 920,
            US: 901,
            IT: 872,
            CA: 420,
            JP: 267,
          },
        },
      ],
    },
  };

  const filterOPtions = [
    { value: "h", name: useTranslate("UI.TODAY") },
    { value: "w", name: useTranslate("UI.WEEK") },
    { value: "m", name: useTranslate("UI.MONTH") },
    { value: "a", name: useTranslate("UI.YEAR") },
  ];

  const perDevice = {
    series: [
      {
        name: useTranslate("Total"),
        data: [1890, 1320, 1293, 920, 901],
      },
    ],
    options: {
      xaxis: {
        categories: [
          useTranslate("COUNTRIES.CHINA"),
          useTranslate("COUNTRIES.FRANCE"),
          useTranslate("COUNTRIES.ARGENTINA"),
          useTranslate("COUNTRIES.BRAZIL"),
          useTranslate("COUNTRIES.UNITED_STATE"),
        ],
      },
    },
  };

  const calculatePercentage = (value) =>
    (
      (value /
        salesByRegion
          ?.map((value) => value?.quantity)
          .reduce((a, b) => a + b, 0)) *
      100
    )?.toFixed(2);

  return (
    <AppPage title="Analytics" breadcrumbs={breadcrumbs}>
      <Container>
        <ContainerItem sm={4} md={4} xl={3}>
          <CardInfoAnalytic values={netIncome} />
        </ContainerItem>

        <ContainerItem sm={4} md={4} xl={3}>
          <CardInfoAnalytic values={totalRevenue} />
        </ContainerItem>

        <ContainerItem sm={4} md={4} xl={3}>
          <CardInfoAnalytic values={totalPuchasement2} />
        </ContainerItem>

        <ContainerItem sm={4} md={4} xl={3}>
          <CardInfoAnalytic values={totalPuchasement} />
        </ContainerItem>
      </Container>

      <Container className="mt-3">
        <ContainerItem sm={4} md={3} xl={4}>
          <Container>
            <ContainerItem sm={4} md={8} xl={12}>
              <AppChart
                title={useTranslate("DASHBOARD.REVENUE_PER_DEVICE")}
                type={"barStacked"}
                options={totalPuchasement2.options}
                series={totalPuchasement2.series}
                height={180}
                padding={{
                  right: 5,
                  left: 5,
                }}
                colors={["#3629B7", "#32A877", "#a75bd2"]}
                filter={filterOPtions}
              />
            </ContainerItem>

            <ContainerItem
              sm={4}
              md={8}
              xl={12}
              className={styles["marketing__goal"]}
            >
              <AppChart
                title={useTranslate("DASHBOARD.MARKETING_GOAL")}
                type={"semiCircleGauge"}
                options={radialChart.options}
                series={radialChart.series}
                legend={false}
                height={180}
                colors={radialChart.colors}
                padding={{
                  bottom: 20,
                }}
                className={styles["reset__shadow"]}
                filter={filterOPtions}
              />
              <div className={styles["marketing__goal__footer"]}>
                <div className={styles["info"]}>
                  <span className={styles["info__label"]}>
                    {useTranslate("DASHBOARD.ORGANIC")}:
                  </span>
                  <span className={styles["info__value"]}>
                    {formatValue(12389.9, "money")}
                  </span>
                </div>

                <div className={styles["info"]}>
                  <span className={styles["info__label"]}>
                    {useTranslate("DASHBOARD.PAY")}:
                  </span>
                  <span className={styles["info__value"]}>
                    {formatValue(16152.12, "money")}
                  </span>
                </div>
              </div>
            </ContainerItem>
          </Container>
        </ContainerItem>

        <ContainerItem sm={4} md={5} xl={8}>
          <AppChart
            title={useTranslate("DASHBOARD.SALES_REPORT")}
            type={"area"}
            options={splineAreaChart.options}
            series={[{ ...splineAreaChart.series[0] }]}
            legend={false}
            direction={"top"}
            alignment={"left"}
            height={375}
            padding={{
              right: 15,
              left: 15,
            }}
            colors={["#584ca5"]}
            filter={filterOPtions}
          />
        </ContainerItem>
      </Container>

      <Container className="mt-3">
        <ContainerItem sm={4} md={4} xl={6}>
          <AppChart
            title={useTranslate("DASHBOARD.ACTIVE_AND_INACTIVE_USERS")}
            type={"multiBar"}
            options={netIncome.options}
            series={netIncome.series}
            legend={true}
            direction={"top"}
            alignment={"left"}
            height={340}
            padding={{
              right: 5,
              left: 5,
            }}
            colors={["#005FED", "#C0C6CF"]}
            filter={filterOPtions}
          />
        </ContainerItem>

        <ContainerItem sm={4} md={4} xl={6}>
          <AppChart
            title={useTranslate("DASHBOARD.REVENUE_PER_DEVICE")}
            type="barStacked"
            options={totalPuchasement2.options}
            series={totalPuchasement2.series}
            legend={true}
            direction="top"
            alignment="right"
            height={340}
            padding={{
              right: 5,
              left: 5,
            }}
            colors={["#F47780", "#e4bc46", "#7722e1"]}
            filter={filterOPtions}
          />
        </ContainerItem>
      </Container>

      <Container className={styles["sales__by__country"]}>
        <ContainerItem sm={4} md={5} xl={8}>
          <Maps
            title={useTranslate("DASHBOARD.SALES_BY_REGION")}
            className={styles["reset__shadow"]}
            data={chartMap}
            map="word"
            content="vendas"
          />
        </ContainerItem>

        <ContainerItem sm={4} md={3} xl={4} className={styles["list__items"]}>
          <div className="d-flex justify-content-between mb-4">
            <div>{useTranslate("DASHBOARD.TOP_REGIONS")}</div>
          </div>
          {salesByRegion.map((country, index) => (
            <div key={index} className="d-flex flex-column mb-2">
              <div>{country.name}</div>

              <div className="w-100">
                <Progress
                  progress={calculatePercentage(country?.quantity)}
                  color={"#005FED"}
                  showProgress={true}
                />
              </div>
            </div>
          ))}
        </ContainerItem>
      </Container>
    </AppPage>
  );
};

export default Analytics;
