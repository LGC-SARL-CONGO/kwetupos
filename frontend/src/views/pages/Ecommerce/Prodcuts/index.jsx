import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

import { useFormatValue } from "../../../../hooks/useFormatValue";
import { translate } from "../../../../hooks/translate";
import { useLocalStorage } from "../../../../hooks/useLocalStorage";

import AppPage from "../../../../components/CustomUI/AppPage";
import Container from "../../../../components/CustomUI/Container";
import ContainerItem from "../../../../components/CustomUI/Container/ContainerItem";
import { Table, Tr, Td } from "../../../../components/BaseUI/Table";
import Picture from "../../../../components/CustomUI/Picture";
import ActionButton from "../../../../components/CustomUI/ActionButton";
import { ToastContainer, Toast } from "../../../../components/CustomUI/Toast";
import SidebarContainer from "../../../../components/CustomUI/SidebarContainer";
import Input from "../../../../components/BaseUI/Input";
import RichTextEditor from "../../../../components/CustomUI/RichTextEditor";
import Button from "../../../../components/BaseUI/Button";
import Select from "../../../../components/BaseUI/Select";
import Switch from "../../../../components/BaseUI/Switch";
import Label from "../../../../components/BaseUI/Label";
import Lozenge from "../../../../components/BaseUI/Lozenge";

import productsJSON from "../../../../mocks/products.json";

const Products = () => {
  const [products, setProducts] = useState(productsJSON);
  const [toasts, setToasts] = useState([]);
  const [sidebarOpened, setSidebarOpened] = useState(false);
  const [productInfo, setProductInfo] = useState({});

  const format = useFormatValue;
  const navigate = useNavigate();
  const { getStorage } = useLocalStorage();

  const productActions = [
    { name: translate("UI.ADD"), to: "", redirect: false },
    { name: translate("UI.IMPORT"), to: "", redirect: false },
    { name: translate("UI.EXPORT"), to: "", redirect: false },
  ];

  const headers = [
    {
      name: translate("UI.NAME"),
      resizable: true,
      sort: true,
      filter: { type: "text", label: translate("UI.NAME"), options: [] },
    },
    {
      name: translate("UI.CATEGORY"),
      resizable: true,
      sort: true,
      filter: {
        type: "option",
        label: translate("UI.CATEGORY"),
        options: [
          {
            value: translate("UI.FOOTWEAR"),
            name: translate("UI.FOOTWEAR"),
          },
          {
            value: translate("UI.FURNITURE"),
            name: translate("UI.FURNITURE"),
          },
        ],
      },
    },
    {
      name: translate("UI.PRICE"),
      resizable: true,
      sort: true,
      filter: {
        type: "between",
        label: translate("UI.PRICE"),
        options: [],
      },
    },
    {
      name: translate("UI.STOCK"),
      resizable: true,
      sort: true,
      filter: {
        type: "between",
        label: translate("UI.STOCK"),
        options: [],
      },
    },
    {
      name: translate("UI.SALES"),
      resizable: true,
      sort: true,
      filter: {
        type: "between",
        label: translate("UI.SALES"),
        options: [],
      },
    },
    {
      name: translate("UI.STATUS"),
      resizable: true,
      sort: true,
      filter: {
        type: "option",
        label: translate("UI.STATUS"),
        options: [
          {
            value: translate("UI.ACTIVE"),
            name: translate("UI.ACTIVE"),
          },
          {
            value: translate("UI.INACTIVE"),
            name: translate("UI.INACTIVE"),
          },
        ],
      },
    },
    {
      name: translate("UI.CREATED"),
      resizable: true,
      sort: true,
      filter: {
        type: "date",
        label: translate("UI.CREATED"),
        options: [],
      },
    },
    {
      name: translate("UI.ACTIONS"),
      resizable: false,
      sort: false,
    },
  ];

  const breadcrumbs = [
    { label: "KwetuPOS", url: "" },
    { label: "eCommerce", url: "" },
    { label: translate("UI.PRODUCTS") },
  ];

  const handleProductInfo = (product) => {
    setSidebarOpened(true);
    setProductInfo(product);
  };

  const deleteProduct = (id) => {
    const product = products?.find((product) => product.id === id);
    const index = products?.findIndex((product) => product.id === id);
    const values = products;

    values?.splice(index, 1);
    setProducts([...values]);

    setToasts([
      {
        description: `The product "${product?.name}" has been successfully deleted from the system.`,
        id: id,
        key: id,
        title: "Product successfully deleted!",
        appearance: "success",
      },
      ...toasts,
    ]);
  };

  const removeToast = (index) => {
    const values = toasts;
    values.splice(index, 1);

    setToasts([...values]);
  };

  const closeSidebar = () => {
    setSidebarOpened(false);
    setProductInfo({});
  };

  return (
    <AppPage
      title={translate("UI.PRODUCTS")}
      breadcrumbs={breadcrumbs}
      actions={
        <Button
          appearance="primary"
          onClick={() => navigate("/dashboard/ecommerce/products/create")}
        >
          {translate("ECOMMERCE.ADD_PRODUCT")}
        </Button>
      }
    >
      <Container>
        <ContainerItem sm={4} md={8} xl={12}>
          <Table
            title={translate("ECOMMERCE.PRODUCT_LIST")}
            columns={headers}
            identifier="product_list"
            enableCheckbox={true}
            locale={getStorage("lang")?.split("-")?.[0] || "en"}
          >
            {products.map((product, index) => (
              <Tr key={index} id={product?.id}>
                <Td>
                  <div className="d-flex align-items-center gap-1">
                    <Picture
                      image={product.image}
                      width="25px"
                      minWidth="25px"
                    />
                    <span>{product.name}</span>
                  </div>
                </Td>
                <Td>
                  <Lozenge appearance="info-subtle">
                    {product?.category}
                  </Lozenge>
                </Td>
                <Td>{format(product?.price, "money")}</Td>
                <Td>
                  <Lozenge appearance="info-subtle">
                    {format(product?.stock, "number")}
                  </Lozenge>
                </Td>
                <Td>
                  <Lozenge appearance="info-subtle">
                    {format(product.salesQuantity, "number")}
                  </Lozenge>
                </Td>
                <Td>
                  <Lozenge
                    appearance={
                      product.status === 1 ? "success-subtle" : "danger-subtle"
                    }
                  >
                    {product.status === 1
                      ? translate("UI.ACTIVE")
                      : translate("UI.INACTIVE")}
                  </Lozenge>
                </Td>
                <Td>{format(product.createdDate, "date")}</Td>
                <Td>
                  <div className="d-flex align-items-center gap-1 u-pointer">
                    <ActionButton onClick={() => handleProductInfo(product)}>
                      <span className="material-symbols-outlined size-20">
                        {translate("UI.EDIT")}
                      </span>
                    </ActionButton>
                    <ActionButton onClick={() => deleteProduct(product.id)}>
                      <span className="material-symbols-outlined size-20">
                        {translate("UI.DELETE")}
                      </span>
                    </ActionButton>
                  </div>
                </Td>
              </Tr>
            ))}
          </Table>
        </ContainerItem>
      </Container>

      <SidebarContainer
        show={sidebarOpened}
        title="Edição de produto"
        onClose={closeSidebar}
      >
        <Input
          type={"text"}
          value={productInfo?.name}
          label={translate("UI.NAME")}
        />

        <Label>{translate("UI.DESCRIPTION")}</Label>
        <RichTextEditor content={productInfo?.description} />

        <Select
          label={translate("UI.CATEGORY")}
          options={[
            { label: "Móveis", value: "Móveis" },
            { label: "Calçados", value: "Calçados" },
          ]}
          selected={productInfo?.category}
          unique={true}
        />

        <Input
          type={"number"}
          value={productInfo?.price}
          label={translate("UI.PRICE")}
        />

        <Input
          type={"number"}
          value={productInfo?.["stock"]}
          label={translate("UI.STOCK")}
        />

        <div className="my-3">
          <div className="label">{translate("UI.COLORS")}</div>
          <div className="mt-3 d-flex align-items-center gap-1">
            {["#7196B8", "#B5B5D8", "#F0EFF5", "#F7D7E0", "#FBB7CB"].map(
              (color, index) => (
                <div
                  key={index}
                  style={{ background: color, width: "30px", height: "30px" }}
                ></div>
              )
            )}
          </div>
        </div>

        <div className="label">{translate("UI.STATUS")}</div>
        <Switch label={"Ativo"} />

        <div className="mt-4">
          <Button
            title={translate("UI.SAVE")}
            appearance="primary"
            onClick={() => setSidebarOpened(false)}
          />
        </div>
      </SidebarContainer>

      <ToastContainer>
        {toasts?.map((toast, index) => (
          <Toast
            {...toast}
            actions={[
              { content: "Dismiss", onClick: () => removeToast(index) },
            ]}
          />
        ))}
      </ToastContainer>
    </AppPage>
  );
};

export default Products;
