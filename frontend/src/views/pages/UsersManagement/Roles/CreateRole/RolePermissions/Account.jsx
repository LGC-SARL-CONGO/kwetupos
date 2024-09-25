import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions liées aux comptes (Account)
export default function Account({ onSelectionChange }) {
  const [data, setData] = useState({
    accessAccounts: false,
    editAccountTransaction: false,
    deleteAccountTransaction: false,
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
          label="Access Accounts"
          value="accessAccounts"
          isChecked={data.accessAccounts}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Edit account transaction"
          value="editAccountTransaction"
          isChecked={data.editAccountTransaction}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={6} md={6} xl={4}>
        <Checkbox
          label="Delete account transaction"
          value="deleteAccountTransaction"
          isChecked={data.deleteAccountTransaction}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
