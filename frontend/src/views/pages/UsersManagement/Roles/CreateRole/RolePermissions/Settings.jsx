import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux paramètres (Settings)
export default function Settings({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    accessBusinessSettings: false,
    accessBarcodeSettings: false,
    accessInvoiceSettings: false,
    accessPrinters: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        accessBusinessSettings: checked,
        accessBarcodeSettings: checked,
        accessInvoiceSettings: checked,
        accessPrinters: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        const allChecked =
          prevData.accessBusinessSettings &&
          prevData.accessBarcodeSettings &&
          prevData.accessInvoiceSettings &&
          prevData.accessPrinters;
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
          label="Access business settings"
          value="accessBusinessSettings"
          isChecked={data.accessBusinessSettings}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Access barcode settings"
          value="accessBarcodeSettings"
          isChecked={data.accessBarcodeSettings}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Access invoice settings"
          value="accessInvoiceSettings"
          isChecked={data.accessInvoiceSettings}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Access printers"
          value="accessPrinters"
          isChecked={data.accessPrinters}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
