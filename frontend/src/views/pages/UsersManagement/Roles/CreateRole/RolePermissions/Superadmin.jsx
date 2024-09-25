import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux superadmins (Superadmin)
export default function Superadmin({ onSelectionChange }) {
  const [data, setData] = useState({
    accessPackageSubscriptions: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    setData((prevData) => ({
      ...prevData,
      [value]: checked,
    }));
  };

  // Utiliser un effet pour transmettre les données mises à jour au parent
  useEffect(() => {
    onSelectionChange(data);
  }, [data, onSelectionChange]);

  return (
    <Container className="p-3">
      <ContainerItem sm={6} md={6} xl={6}>
        <Checkbox
          label="Access package subscriptions"
          value="accessPackageSubscriptions"
          isChecked={data.accessPackageSubscriptions}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
