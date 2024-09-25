import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions "User"
export default function User({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewUser: false,
    addUser: false,
    editUser: false,
    deleteUser: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "selectAll" est coché, on coche/décoche toutes les cases
      setData({
        selectAll: checked,
        viewUser: checked,
        addUser: checked,
        editUser: checked,
        deleteUser: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => ({
        ...prevData,
        [value]: checked,
        selectAll:
          checked &&
          prevData.viewUser &&
          prevData.addUser &&
          prevData.editUser &&
          prevData.deleteUser,
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
          label="View user"
          value="viewUser"
          isChecked={data.viewUser}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add user"
          value="addUser"
          isChecked={data.addUser}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit user"
          value="editUser"
          isChecked={data.editUser}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete user"
          value="deleteUser"
          isChecked={data.deleteUser}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
