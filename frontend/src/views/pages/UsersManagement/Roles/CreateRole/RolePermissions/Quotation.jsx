import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions des devis (Quotations)
export default function Quotation({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewAllQuotations: false,
    viewOwnQuotations: false,
    editQuotation: false,
    deleteQuotation: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewAllQuotations: false, // Assurez-vous que viewAllQuotations est désactivé lorsque selectAll est activé
        viewOwnQuotations: true, // On suppose que viewOwnQuotations doit rester activé
        editQuotation: checked,
        deleteQuotation: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases sont cochées
        const allChecked = prevData.editQuotation && prevData.deleteQuotation;
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
      viewAllQuotations: value === "viewAllQuotations",
      viewOwnQuotations: value === "viewOwnQuotations",
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
            { label: "View all quotations", value: "viewAllQuotations" },
            { label: "View own quotations", value: "viewOwnQuotations" },
          ]}
          selected={
            data.viewAllQuotations
              ? "viewAllQuotations"
              : data.viewOwnQuotations
              ? "viewOwnQuotations"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit quotation"
          value="editQuotation"
          isChecked={data.editQuotation}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete quotation"
          value="deleteQuotation"
          isChecked={data.deleteQuotation}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
