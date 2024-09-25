import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";

// Composant pour gérer les permissions POS
export default function POS({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewPOSSell: false,
    addPOSSell: false,
    editPOSSell: false,
    deletePOSSell: false,
    editProductPrice: false,
    editProductDiscount: false,
    addEditPayment: false,
    printInvoice: false,
    disableMultiplePay: false,
    disableDraft: false,
    disableExpressCheckout: false,
    disableDiscount: false,
    disableSuspendSale: false,
    disableCreditSaleButton: false,
    disableQuotation: false,
    disableCard: false,
  });

  // Fonction pour gérer le changement des cases à cocher
  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      // Si "selectAll" est coché, on coche/décoche toutes les cases
      setData({
        selectAll: checked,
        viewPOSSell: checked,
        addPOSSell: checked,
        editPOSSell: checked,
        deletePOSSell: checked,
        editProductPrice: checked,
        editProductDiscount: checked,
        addEditPayment: checked,
        printInvoice: checked,
        disableMultiplePay: checked,
        disableDraft: checked,
        disableExpressCheckout: checked,
        disableDiscount: checked,
        disableSuspendSale: checked,
        disableCreditSaleButton: checked,
        disableQuotation: checked,
        disableCard: checked,
      });
    } else {
      // Mettre à jour uniquement la case cochée
      setData((prevData) => ({
        ...prevData,
        [value]: checked,
        selectAll: checked && Object.values(prevData).every((v) => v),
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
          label="View POS sell"
          value="viewPOSSell"
          isChecked={data.viewPOSSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add POS sell"
          value="addPOSSell"
          isChecked={data.addPOSSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit POS sell"
          value="editPOSSell"
          isChecked={data.editPOSSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete POS sell"
          value="deletePOSSell"
          isChecked={data.deletePOSSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit product price from POS screen"
          value="editProductPrice"
          isChecked={data.editProductPrice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit product discount from POS screen"
          value="editProductDiscount"
          isChecked={data.editProductDiscount}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add/Edit Payment"
          value="addEditPayment"
          isChecked={data.addEditPayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Print Invoice"
          value="printInvoice"
          isChecked={data.printInvoice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Multiple Pay"
          value="disableMultiplePay"
          isChecked={data.disableMultiplePay}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Draft"
          value="disableDraft"
          isChecked={data.disableDraft}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Express Checkout"
          value="disableExpressCheckout"
          isChecked={data.disableExpressCheckout}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Discount"
          value="disableDiscount"
          isChecked={data.disableDiscount}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Suspend Sale"
          value="disableSuspendSale"
          isChecked={data.disableSuspendSale}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable credit sale button"
          value="disableCreditSaleButton"
          isChecked={data.disableCreditSaleButton}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Quotation"
          value="disableQuotation"
          isChecked={data.disableQuotation}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Disable Card"
          value="disableCard"
          isChecked={data.disableCard}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
