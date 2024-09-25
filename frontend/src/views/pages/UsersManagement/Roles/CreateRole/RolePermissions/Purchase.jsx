import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assurez-vous d'avoir un composant Radio

// Composant pour gérer les permissions "Purchase"
export default function Purchase({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewAllPurchase: false,
    viewOwnPurchase: false, // Initialisé à true pour que ce soit sélectionné avec "Select all"
    addPurchase: false,
    editPurchase: false,
    deletePurchase: false,
    addPurchasePayment: false,
    editPurchasePayment: false,
    deletePurchasePayment: false,
    updateStatus: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewAllPurchase: checked,
        viewOwnPurchase: true, // Assurez-vous que "viewOwnPurchase" est toujours sélectionné
        addPurchase: checked,
        editPurchase: checked,
        deletePurchase: checked,
        addPurchasePayment: checked,
        editPurchasePayment: checked,
        deletePurchasePayment: checked,
        updateStatus: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        const allChecked =
          prevData.viewAllPurchase &&
          prevData.viewOwnPurchase &&
          prevData.addPurchase &&
          prevData.editPurchase &&
          prevData.deletePurchase &&
          prevData.addPurchasePayment &&
          prevData.editPurchasePayment &&
          prevData.deletePurchasePayment &&
          prevData.updateStatus;
        return {
          ...prevData,
          [value]: checked,
          selectAll: checked && allChecked, // Activer "Select all" si toutes les cases sont cochées
        };
      });
    }
  };

  // Fonction pour gérer le changement des boutons radio
  const handleRadioChange = (value) => {
    setData((prevData) => ({
      ...prevData,
      viewAllPurchase: value === "viewAllPurchase",
      viewOwnPurchase: value === "viewOwnPurchase",
      selectAll: false, // Désactiver "Select all" si un bouton radio est sélectionné
    }));
  };

  // Utiliser un effet pour transmettre les données mises à jour au parent
  useEffect(() => {
    onSelectionChange(data);
  }, [data, onSelectionChange]);

  // Options pour les boutons radio
  const radioOptions = [
    { label: "View all Purchase & Stock Adjustment", value: "viewAllPurchase" },
    { label: "View own Purchase & Stock Adjustment", value: "viewOwnPurchase" },
  ];

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
        <Radio
          options={radioOptions}
          selected={
            data.viewAllPurchase ? "viewAllPurchase" : "viewOwnPurchase"
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add purchase & Stock Adjustment"
          value="addPurchase"
          isChecked={data.addPurchase}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit purchase & Stock Adjustment"
          value="editPurchase"
          isChecked={data.editPurchase}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete purchase & Stock Adjustment"
          value="deletePurchase"
          isChecked={data.deletePurchase}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add purchase payment"
          value="addPurchasePayment"
          isChecked={data.addPurchasePayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit purchase payment"
          value="editPurchasePayment"
          isChecked={data.editPurchasePayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete purchase payment"
          value="deletePurchasePayment"
          isChecked={data.deletePurchasePayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Update Status"
          value="updateStatus"
          isChecked={data.updateStatus}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
