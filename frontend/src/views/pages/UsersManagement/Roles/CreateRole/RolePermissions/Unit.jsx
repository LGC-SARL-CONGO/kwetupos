import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux unités (Unit)
export default function Unit({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewUnit: false,
    addUnit: false,
    editUnit: false,
    deleteUnit: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche toutes les cases
      setData({
        selectAll: checked,
        viewUnit: checked,
        addUnit: checked,
        editUnit: checked,
        deleteUnit: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        const allChecked =
          prevData.viewUnit &&
          prevData.addUnit &&
          prevData.editUnit &&
          prevData.deleteUnit;
        return {
          ...prevData,
          [value]: checked,
          selectAll: checked && allChecked, // Activer "Select all" si toutes les cases nécessaires sont cochées
        };
      });
    }
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
        <Checkbox
          label="View unit"
          value="viewUnit"
          isChecked={data.viewUnit}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add unit"
          value="addUnit"
          isChecked={data.addUnit}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit unit"
          value="editUnit"
          isChecked={data.editUnit}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete unit"
          value="deleteUnit"
          isChecked={data.deleteUnit}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
