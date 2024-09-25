import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions "Customer"
export default function Customer({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewAllCustomer: false,
    viewOwnCustomer: false,
    viewNoSell1Month: false,
    viewNoSell3Months: false,
    viewNoSell6Months: false,
    viewNoSell1Year: false,
    viewIrrespectiveOfSell: false,
    addCustomer: false,
    editCustomer: false,
    deleteCustomer: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche/décoche toutes les cases nécessaires
      setData({
        selectAll: checked,
        viewAllCustomer: false, // Assurez-vous que viewAllCustomer est désactivé lorsque selectAll est activé
        viewOwnCustomer: true, // Cocher View own customer
        viewNoSell1Month: false,
        viewNoSell3Months: false,
        viewNoSell6Months: false,
        viewNoSell1Year: false,
        viewIrrespectiveOfSell: true, // Cocher View customers irrespective of their sell
        addCustomer: checked,
        editCustomer: checked,
        deleteCustomer: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases nécessaires sont cochées
        const allChecked =
          prevData.addCustomer &&
          prevData.editCustomer &&
          prevData.deleteCustomer;
        return {
          ...prevData,
          [value]: checked,
          selectAll: checked && allChecked, // Activer "Select all" si toutes les cases nécessaires sont cochées
        };
      });
    }
  };

  // Fonction pour gérer le changement des boutons radio
  const handleRadioChange = (value, group) => {
    setData((prevData) => ({
      ...prevData,
      [group]: value,
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
            { label: "View all customer", value: "viewAllCustomer" },
            { label: "View own customer", value: "viewOwnCustomer" },
          ]}
          selected={
            data.viewAllCustomer
              ? "viewAllCustomer"
              : data.viewOwnCustomer
              ? "viewOwnCustomer"
              : null
          }
          onChange={(value) => handleRadioChange(value, "viewCustomerGroup")}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Radio
          options={[
            {
              label: "View customers with no sell from one month only",
              value: "viewNoSell1Month",
            },
            {
              label: "View customers with no sell from three months only",
              value: "viewNoSell3Months",
            },
            {
              label: "View customers with no sell from six months only",
              value: "viewNoSell6Months",
            },
            {
              label: "View customers with no sell from one year only",
              value: "viewNoSell1Year",
            },
            {
              label: "View customers irrespective of their sell",
              value: "viewIrrespectiveOfSell",
            },
          ]}
          selected={
            data.viewNoSell1Month
              ? "viewNoSell1Month"
              : data.viewNoSell3Months
              ? "viewNoSell3Months"
              : data.viewNoSell6Months
              ? "viewNoSell6Months"
              : data.viewNoSell1Year
              ? "viewNoSell1Year"
              : data.viewIrrespectiveOfSell
              ? "viewIrrespectiveOfSell"
              : null
          }
          onChange={(value) => handleRadioChange(value, "viewNoSellGroup")}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add customer"
          value="addCustomer"
          isChecked={data.addCustomer}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit customer"
          value="editCustomer"
          isChecked={data.editCustomer}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete customer"
          value="deleteCustomer"
          isChecked={data.deleteCustomer}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
