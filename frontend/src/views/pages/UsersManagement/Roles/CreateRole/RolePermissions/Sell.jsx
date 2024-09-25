import React, { useState, useEffect } from "react";
import Container from "../../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../../components/CustomUI/Container/ContainerItem";
import Checkbox from "../../../../../../components/BaseUI/Checkbox";
import Radio from "../../../../../../components/BaseUI/Radio";

// Composant pour gérer les permissions de vente
export default function Sell({ onSelectionChange }) {
  const [data, setData] = useState({
    selectAll: false,
    viewAllSell: false,
    viewOwnSellOnly: true, // Initialiser "viewOwnSellOnly" à true pour la sélection par défaut
    viewPaidSellsOnly: false,
    viewDueSellsOnly: false,
    viewPartiallyPaidSellsOnly: false,
    viewOverdueSellsOnly: false,
    addSell: false,
    updateSell: false,
    deleteSell: false,
    commissionAgentViewOwnSell: false,
    addSellPayment: false,
    editSellPayment: false,
    deleteSellPayment: false,
    editProductPrice: false,
    editProductDiscount: false,
    addEditDeleteDiscount: false,
    accessTypesOfService: false,
    accessAllSellReturn: false,
    accessOwnSellReturn: false,
    addEditInvoiceNumber: false,
  });

  const [radioSelection, setRadioSelection] = useState("viewOwnSellOnly");

  const handleCheckboxChange = ({ value, checked }) => {
    if (value === "selectAll") {
      setData({
        selectAll: checked,
        viewAllSell: checked,
        viewOwnSellOnly: true, // Assurez-vous que "viewOwnSellOnly" est vrai
        viewPaidSellsOnly: checked,
        viewDueSellsOnly: checked,
        viewPartiallyPaidSellsOnly: checked,
        viewOverdueSellsOnly: checked,
        addSell: checked,
        updateSell: checked,
        deleteSell: checked,
        commissionAgentViewOwnSell: checked,
        addSellPayment: checked,
        editSellPayment: checked,
        deleteSellPayment: checked,
        editProductPrice: checked,
        editProductDiscount: checked,
        addEditDeleteDiscount: checked,
        accessTypesOfService: checked,
        accessAllSellReturn: checked,
        accessOwnSellReturn: checked,
        addEditInvoiceNumber: checked,
      });
    } else {
      setData((prevData) => ({
        ...prevData,
        [value]: checked,
        selectAll: checked && Object.values(prevData).every((v) => v),
      }));
    }
  };

  const handleRadioChange = (value) => {
    setRadioSelection(value);
  };

  useEffect(() => {
    // Mettre à jour les données en fonction de la sélection des radios
    setData((prevData) => ({
      ...prevData,
      viewOwnSellOnly: radioSelection === "viewOwnSellOnly",
    }));

    // Transmettre les données mises à jour au parent
    onSelectionChange({ ...data, viewOption: radioSelection });
  }, [data, radioSelection, onSelectionChange]);

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
          label="View all sell"
          value="viewAllSell"
          isChecked={data.viewAllSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Radio
          options={[
            { label: "View own sell only", value: "viewOwnSellOnly" },
            { label: "View all sell", value: "viewAllSell" },
          ]}
          selected={radioSelection}
          onChange={handleRadioChange}
          direction="row"
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="View paid sells only"
          value="viewPaidSellsOnly"
          isChecked={data.viewPaidSellsOnly}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="View due sells only"
          value="viewDueSellsOnly"
          isChecked={data.viewDueSellsOnly}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="View partially paid sells only"
          value="viewPartiallyPaidSellsOnly"
          isChecked={data.viewPartiallyPaidSellsOnly}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="View overdue sells only"
          value="viewOverdueSellsOnly"
          isChecked={data.viewOverdueSellsOnly}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add Sell"
          value="addSell"
          isChecked={data.addSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Update Sell"
          value="updateSell"
          isChecked={data.updateSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete Sell"
          value="deleteSell"
          isChecked={data.deleteSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Commission agent can view their own sell"
          value="commissionAgentViewOwnSell"
          isChecked={data.commissionAgentViewOwnSell}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add sell payment"
          value="addSellPayment"
          isChecked={data.addSellPayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit sell payment"
          value="editSellPayment"
          isChecked={data.editSellPayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Delete sell payment"
          value="deleteSellPayment"
          isChecked={data.deleteSellPayment}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit product price from sales screen"
          value="editProductPrice"
          isChecked={data.editProductPrice}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Edit product discount from Sale screen"
          value="editProductDiscount"
          isChecked={data.editProductDiscount}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add/Edit/Delete Discount"
          value="addEditDeleteDiscount"
          isChecked={data.addEditDeleteDiscount}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Access types of service"
          value="accessTypesOfService"
          isChecked={data.accessTypesOfService}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Access all sell return"
          value="accessAllSellReturn"
          isChecked={data.accessAllSellReturn}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Access own sell return"
          value="accessOwnSellReturn"
          isChecked={data.accessOwnSellReturn}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
      <ContainerItem sm={4} md={4} xl={4}>
        <Checkbox
          label="Add/Edit/Delete Invoice Number"
          value="addEditInvoiceNumber"
          isChecked={data.addEditInvoiceNumber}
          onChange={handleCheckboxChange}
        />
      </ContainerItem>
    </Container>
  );
}
