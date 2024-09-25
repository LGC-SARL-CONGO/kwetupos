import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions "Other"
export default function Others({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    serviceStaff: false,
    viewExport: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "selectAll" est coché, on coche/décoche toutes les cases
      setData({
        selectAll: checked,
        serviceStaff: checked,
        viewExport: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => ({
        ...prevData,
        [value]: checked,
        selectAll: checked && prevData.serviceStaff && prevData.viewExport,
      }));
    }
  };

  // Utiliser un effet pour transmettre les données mises à jour au parent
  useEffect(() => {
    onSelectionChange(data);
  }, [data, onSelectionChange]);

  return (
    <Container className="p-3">
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Select all"
          value="selectAll"
          isChecked={data.selectAll}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Service Staff"
          value="serviceStaff"
          isChecked={data.serviceStaff}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="View export to buttons (csv/excel/print/pdf) on tables"
          value="viewExport"
          isChecked={data.viewExport}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
