import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio"; // Assure-toi d'avoir un composant Radio

// Composant pour gérer les permissions des expéditions (Shipments)
export default function Shipments({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    accessAllShipments: false,
    accessOwnShipments: false,
    accessPendingShipments: false,
    accessOwnShipmentsForAgent: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        accessAllShipments: false, // Assurez-vous que accessAllShipments est désactivé lorsque selectAll est activé
        accessOwnShipments: true, // On suppose que accessOwnShipments doit rester activé
        accessPendingShipments: checked,
        accessOwnShipmentsForAgent: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases nécessaires sont cochées
        const allChecked =
          prevData.accessPendingShipments &&
          prevData.accessOwnShipmentsForAgent;
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
      accessAllShipments: value === "accessAllShipments",
      accessOwnShipments: value === "accessOwnShipments",
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
            { label: "Access all shipments", value: "accessAllShipments" },
            { label: "Access own shipments", value: "accessOwnShipments" },
          ]}
          selected={
            data.accessAllShipments
              ? "accessAllShipments"
              : data.accessOwnShipments
              ? "accessOwnShipments"
              : null
          }
          onChange={handleRadioChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Access pending shipments only"
          value="accessPendingShipments"
          isChecked={data.accessPendingShipments}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Commission agent can access their own shipments"
          value="accessOwnShipmentsForAgent"
          isChecked={data.accessOwnShipmentsForAgent}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
