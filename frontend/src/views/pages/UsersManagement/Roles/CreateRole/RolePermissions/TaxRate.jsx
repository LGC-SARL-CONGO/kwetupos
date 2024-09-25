import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux taux de taxe (Tax Rate)
export default function TaxRate({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewTaxRate: false,
    addTaxRate: false,
    editTaxRate: false,
    deleteTaxRate: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewTaxRate: checked,
        addTaxRate: checked,
        editTaxRate: checked,
        deleteTaxRate: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        const allChecked =
          prevData.viewTaxRate &&
          prevData.addTaxRate &&
          prevData.editTaxRate &&
          prevData.deleteTaxRate;
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
          label="View tax rate"
          value="viewTaxRate"
          isChecked={data.viewTaxRate}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add tax rate"
          value="addTaxRate"
          isChecked={data.addTaxRate}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit tax rate"
          value="editTaxRate"
          isChecked={data.editTaxRate}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete tax rate"
          value="deleteTaxRate"
          isChecked={data.deleteTaxRate}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
