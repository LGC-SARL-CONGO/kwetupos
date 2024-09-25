import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux rapports (Report)
export default function Report({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewPurchaseSellReport: false,
    viewTaxReport: false,
    viewSupplierCustomerReport: false,
    viewExpenseReport: false,
    viewProfitLossReport: false,
    viewStockReports: false,
    viewTrendingProductReport: false,
    viewRegisterReport: false,
    viewSalesRepresentativeReport: false,
    viewProductStockValue: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewPurchaseSellReport: checked,
        viewTaxReport: checked,
        viewSupplierCustomerReport: checked,
        viewExpenseReport: checked,
        viewProfitLossReport: checked,
        viewStockReports: checked,
        viewTrendingProductReport: checked,
        viewRegisterReport: checked,
        viewSalesRepresentativeReport: checked,
        viewProductStockValue: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        const allChecked =
          prevData.viewPurchaseSellReport &&
          prevData.viewTaxReport &&
          prevData.viewSupplierCustomerReport &&
          prevData.viewExpenseReport &&
          prevData.viewProfitLossReport &&
          prevData.viewStockReports &&
          prevData.viewTrendingProductReport &&
          prevData.viewRegisterReport &&
          prevData.viewSalesRepresentativeReport &&
          prevData.viewProductStockValue;
        return {
          ...prevData,
          [value]: checked,
          selectAll: checked && allChecked, // Activer "Select all" si toutes les cases nécessaires sont cochées
        };
      });
    }
  };

  // Utiliser un effet pour transmettre les données mises à jour au parent
  useEffect(() => {
    onSelectionChange(data);
  }, [data, onSelectionChange]);

  return (
    <Container className="p-3">
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Select all"
          value="selectAll"
          isChecked={data.selectAll}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View purchase & sell report"
          value="viewPurchaseSellReport"
          isChecked={data.viewPurchaseSellReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View Tax report"
          value="viewTaxReport"
          isChecked={data.viewTaxReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View Supplier & Customer report"
          value="viewSupplierCustomerReport"
          isChecked={data.viewSupplierCustomerReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View expense report"
          value="viewExpenseReport"
          isChecked={data.viewExpenseReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View profit/loss report"
          value="viewProfitLossReport"
          isChecked={data.viewProfitLossReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View stock report, stock adjustment report & stock expiry report"
          value="viewStockReports"
          isChecked={data.viewStockReports}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View trending product report"
          value="viewTrendingProductReport"
          isChecked={data.viewTrendingProductReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View register report"
          value="viewRegisterReport"
          isChecked={data.viewRegisterReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View sales representative report"
          value="viewSalesRepresentativeReport"
          isChecked={data.viewSalesRepresentativeReport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View product stock value"
          value="viewProductStockValue"
          isChecked={data.viewProductStockValue}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
