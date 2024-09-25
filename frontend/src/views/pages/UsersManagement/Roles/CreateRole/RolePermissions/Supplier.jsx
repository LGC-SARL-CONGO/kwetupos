import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions "Supplier"
export default function Supplier({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewAllSupplier: false,
    viewOwnSupplier: false,
    addSupplier: false,
    editSupplier: false,
    deleteSupplier: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewAllSupplier: false, // Assurez-vous que viewAllSupplier est désactivé lorsque selectAll est activé
        viewOwnSupplier: true, // On suppose que viewOwnSupplier doit rester activé
        addSupplier: checked,
        editSupplier: checked,
        deleteSupplier: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases sont cochées
        const allChecked =
          prevData.addSupplier &&
          prevData.editSupplier &&
          prevData.deleteSupplier;
        return {
          ...prevData,
          [value]: checked,
          selectAll: checked && allChecked, // Activer "Select all" si toutes les cases nécessaires sont cochées
        };
      });
    }
  };

  // Fonction pour gérer le changement des boutons radio
  const handleRadioChange = (value) => {
    setData((prevData) => ({
      ...prevData,
      viewAllSupplier: value === "viewAllSupplier",
      viewOwnSupplier: value === "viewOwnSupplier",
      selectAll: false, // Désactiver "Select all" si un bouton radio est sélectionné
    }));
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
        <Radio
          options={[
            { label: "View all supplier", value: "viewAllSupplier" },
            { label: "View own supplier", value: "viewOwnSupplier" },
          ]}
          selected={
            data.viewAllSupplier
              ? "viewAllSupplier"
              : data.viewOwnSupplier
              ? "viewOwnSupplier"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add supplier"
          value="addSupplier"
          isChecked={data.addSupplier}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit supplier"
          value="editSupplier"
          isChecked={data.editSupplier}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete supplier"
          value="deleteSupplier"
          isChecked={data.deleteSupplier}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
