import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées à la page d'accueil (Home)
export default function Home({ onSelectionChange }) {
  const [data, setData] = useState({
    viewHomeData: false,
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
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="View Home data"
          value="viewHomeData"
          isChecked={data.viewHomeData}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
