import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions des brouillons (Drafts)
export default function Draft({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewAllDrafts: false,
    viewOwnDrafts: false,
    editDraft: false,
    deleteDraft: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewAllDrafts: false, // Assurez-vous que viewAllDrafts est désactivé lorsque selectAll est activé
        viewOwnDrafts: true, // On suppose que viewOwnDrafts doit rester activé
        editDraft: checked,
        deleteDraft: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases sont cochées
        const allChecked = prevData.editDraft && prevData.deleteDraft;
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
      viewAllDrafts: value === "viewAllDrafts",
      viewOwnDrafts: value === "viewOwnDrafts",
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
            { label: "View all drafts", value: "viewAllDrafts" },
            { label: "View own drafts", value: "viewOwnDrafts" },
          ]}
          selected={
            data.viewAllDrafts
              ? "viewAllDrafts"
              : data.viewOwnDrafts
              ? "viewOwnDrafts"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit draft"
          value="editDraft"
          isChecked={data.editDraft}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete draft"
          value="deleteDraft"
          isChecked={data.deleteDraft}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
