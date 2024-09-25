import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions "Roles"
export default function Roles({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewRole: false,
    addRole: false,
    editRole: false,
    deleteRole: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "selectAll" est coché, on coche/décoche toutes les cases
      setData({
        selectAll: checked,
        viewRole: checked,
        addRole: checked,
        editRole: checked,
        deleteRole: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => ({
        ...prevData,
        [value]: checked,
        selectAll:
          checked &&
          prevData.viewRole &&
          prevData.addRole &&
          prevData.editRole &&
          prevData.deleteRole,
      }));
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
          label="View role"
          value="viewRole"
          isChecked={data.viewRole}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add role"
          value="addRole"
          isChecked={data.addRole}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit role"
          value="editRole"
          isChecked={data.editRole}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete role"
          value="deleteRole"
          isChecked={data.deleteRole}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
