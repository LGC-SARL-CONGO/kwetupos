import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions liées aux réservations (Bookings)
export default function Bookings({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    addEditViewAllBookings: false,
    addEditViewOwnBookings: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        addEditViewAllBookings: checked,
        addEditViewOwnBookings: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases sont cochées
        const allChecked =
          prevData.addEditViewAllBookings &&
          prevData.addEditViewOwnBookings;
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
      addEditViewAllBookings: value === "addEditViewAllBookings",
      addEditViewOwnBookings: value === "addEditViewOwnBookings",
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
            { label: "Add/Edit/View all bookings", value: "addEditViewAllBookings" },
            { label: "Add/Edit/View own bookings", value: "addEditViewOwnBookings" },
          ]}
          selected={
            data.addEditViewAllBookings
              ? "addEditViewAllBookings"
              : data.addEditViewOwnBookings
              ? "addEditViewOwnBookings"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
    </Container>
  );
}
