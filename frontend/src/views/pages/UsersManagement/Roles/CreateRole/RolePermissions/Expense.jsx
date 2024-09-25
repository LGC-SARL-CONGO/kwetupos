import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions liées aux dépenses (Expense)
export default function Expense({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    accessAllExpenses: false,
    viewOwnExpenseOnly: false,
    addExpense: false,
    editExpense: false,
    deleteExpense: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        accessAllExpenses: false, // Assurez-vous que accessAllExpenses est désactivé lorsque selectAll est activé
        viewOwnExpenseOnly: false, // Assurez-vous que viewOwnExpenseOnly est désactivé lorsque selectAll est activé
        addExpense: checked,
        editExpense: checked,
        deleteExpense: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases sont cochées
        const allChecked =
          prevData.addExpense && prevData.editExpense && prevData.deleteExpense;
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
      accessAllExpenses: value === "accessAllExpenses",
      viewOwnExpenseOnly: value === "viewOwnExpenseOnly",
      selectAll: false, // Désactiver "Select all" si un bouton radio est sélectionné
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
          label="Select all"
          value="selectAll"
          isChecked={data.selectAll}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Radio
          options={[
            { label: "Access all expenses", value: "accessAllExpenses" },
            { label: "View own expense only", value: "viewOwnExpenseOnly" },
          ]}
          selected={
            data.accessAllExpenses
              ? "accessAllExpenses"
              : data.viewOwnExpenseOnly
              ? "viewOwnExpenseOnly"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Add Expense"
          value="addExpense"
          isChecked={data.addExpense}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Edit Expense"
          value="editExpense"
          isChecked={data.editExpense}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Delete Expense"
          value="deleteExpense"
          isChecked={data.deleteExpense}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
