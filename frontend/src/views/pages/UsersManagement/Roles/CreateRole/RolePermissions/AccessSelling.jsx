import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux groupes de prix de vente (AccessSellingPriceGroups)
export default function AccessSelling({ onSelectionChange }) {
  const [data, setData] = useState({
    defaultSellingPrice: false,
    accessTables: false,
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
          label="Default Selling Price"
          value="defaultSellingPrice"
          isChecked={data.defaultSellingPrice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={6}>
        <Checkbox
          label="Access tables"
          value="accessTables"
          isChecked={data.accessTables}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
