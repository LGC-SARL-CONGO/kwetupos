import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions liées aux réparations (Repair)
export default function Repair({ onSelectionChange }) {
  const [data, setData] = useState({
    addInvoice: false,
    editInvoice: false,
    viewAllInvoice: false,
    viewOwnInvoice: false,
    deleteInvoice: false,
    changeInvoiceStatus: false,
    addJobSheetStatus: false,
    editJobSheetStatus: false,
    deleteJobSheetStatus: false,
    addJobSheet: false,
    editJobSheet: false,
    deleteJobSheet: false,
    viewOnlyAssignedJobSheet: false,
    viewAllJobSheets: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    setData((prevData) => ({
      ...prevData,
      [value]: checked,
    }));
  };

  // Fonction pour gérer le changement des boutons radio
  const handleRadioChange = (value) => {
    setData((prevData) => ({
      ...prevData,
      viewOnlyAssignedJobSheet: value === "viewOnlyAssignedJobSheet",
      viewAllJobSheets: value === "viewAllJobSheets",
    }));
  };

  // Utiliser un effet pour transmettre les données mises à jour au parent
  useEffect(() => {
    onSelectionChange(data);
  }, [data, onSelectionChange]);

  return (
    <Container className="p-3">
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Add Invoice"
          value="addInvoice"
          isChecked={data.addInvoice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Edit Invoice"
          value="editInvoice"
          isChecked={data.editInvoice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View all invoice"
          value="viewAllInvoice"
          isChecked={data.viewAllInvoice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View own invoice"
          value="viewOwnInvoice"
          isChecked={data.viewOwnInvoice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Delete Invoice"
          value="deleteInvoice"
          isChecked={data.deleteInvoice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Change Invoice Status"
          value="changeInvoiceStatus"
          isChecked={data.changeInvoiceStatus}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Add Job Sheet Status"
          value="addJobSheetStatus"
          isChecked={data.addJobSheetStatus}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Edit Job Sheet Status"
          value="editJobSheetStatus"
          isChecked={data.editJobSheetStatus}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Delete Job Sheet Status"
          value="deleteJobSheetStatus"
          isChecked={data.deleteJobSheetStatus}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Add Job Sheet"
          value="addJobSheet"
          isChecked={data.addJobSheet}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Edit Job Sheet"
          value="editJobSheet"
          isChecked={data.editJobSheet}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Delete Job Sheet"
          value="deleteJobSheet"
          isChecked={data.deleteJobSheet}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Radio
          options={[
            {
              label: "View Only Assigned Job Sheet",
              value: "viewOnlyAssignedJobSheet",
            },
            { label: "View All Job Sheets", value: "viewAllJobSheets" },
          ]}
          selected={
            data.viewOnlyAssignedJobSheet
              ? "viewOnlyAssignedJobSheet"
              : data.viewAllJobSheets
              ? "viewAllJobSheets"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
    </Container>
  );
}
