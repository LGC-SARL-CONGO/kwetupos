import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions "Product"
export default function Product({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewProduct: false,
    addProduct: false,
    editProduct: false,
    deleteProduct: false,
    addOpeningStock: false,
    viewPurchasePrice: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "Select all" est coché, on coche/décoche toutes les cases
      setData({
        selectAll: checked,
        viewProduct: checked,
        addProduct: checked,
        editProduct: checked,
        deleteProduct: checked,
        addOpeningStock: checked,
        viewPurchasePrice: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => {
        // Vérifier si toutes les cases nécessaires sont cochées
        const allChecked =
          prevData.viewProduct &&
          prevData.addProduct &&
          prevData.editProduct &&
          prevData.deleteProduct &&
          prevData.addOpeningStock &&
          prevData.viewPurchasePrice;
        return {
          ...prevData,
          [value]: checked,
          selectAll: checked && allChecked, // Activer "Select all" si toutes les cases sont cochées
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
          label="View product"
          value="viewProduct"
          isChecked={data.viewProduct}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add product"
          value="addProduct"
          isChecked={data.addProduct}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit product"
          value="editProduct"
          isChecked={data.editProduct}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete product"
          value="deleteProduct"
          isChecked={data.deleteProduct}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add Opening Stock"
          value="addOpeningStock"
          isChecked={data.addOpeningStock}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="View Purchase Price"
          value="viewPurchasePrice"
          isChecked={data.viewPurchasePrice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
