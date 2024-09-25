import React, { useState } from "react";

import { useFormatValue } from "../../../../hooks/useFormatValue";
import { translate } from "../../../../hooks/translate";
import { useLocalStorage } from "../../../../hooks/useLocalStorage";

import AppPage from "../../../../components/CustomUI/AppPage";
import Container from "../../../../components/CustomUI/Container";
import ContainerItem from "../../../../components/CustomUI/Container/ContainerItem";
import { Table, Tr, Td } from "../../../../components/BaseUI/Table";
import {
  Modal,
  ModalHeader,
  ModalBody,
  ModalFooter,
} from "../../../../components/BaseUI/Modal";
import ListGroup from "../../../../components/BaseUI/ListGroup";
import ListItem from "../../../../components/BaseUI/ListGroup/ListItem";
import Picture from "../../../../components/CustomUI/Picture";
import SidebarContainer from "../../../../components/CustomUI/SidebarContainer";
import Input from "../../../../components/BaseUI/Input";
import Select from "../../../../components/BaseUI/Select";
import ActionButton from "../../../../components/CustomUI/ActionButton";

import ordersJSON from "../../../../mocks/orders.json";
import productsJSON from "../../../../mocks/products.json";
import Button from "../../../../components/BaseUI/Button";
import Lozenge from "../../../../components/BaseUI/Lozenge";

const Orders = () => {
  const [orders, setOrders] = useState(ordersJSON);
  const [openModal, setOpenModal] = useState(false);
  const [orderDetail, setOrderDetail] = useState(null);
  const [productInfo, setProductInfo] = useState(null);
  const [sidebarOpened, setSidebarOpened] = useState(false);

  const format = useFormatValue;
  const { getStorage } = useLocalStorage();

  const headers = [
    {
      name: translate("ECOMMERCE.ORDER_ID"),
      resizable: true,
      sort: true,
      filter: {
        type: "text",
        label: translate("ECOMMERCE.ORDER_ID"),
        options: [],
      },
    },
    {
      name: translate("UI.DATE"),
      resizable: true,
      sort: true,
      filter: { type: "date", label: translate("UI.DATE"), options: [] },
    },
    {
      name: translate("UI.TOTAL"),
      resizable: true,
      sort: true,
      filter: {
        type: "between",
        label: translate("UI.TOTAL"),
        options: [],
      },
    },
    {
      name: translate("ECOMMERCE.PAYMENT_STATUS"),
      resizable: true,
      sort: true,
      filter: {
        type: "option",
        label: translate("ECOMMERCE.PAYMENT_STATUS"),
        options: [
          {
            value: translate("ECOMMERCE.PROCESSING"),
            name: translate("ECOMMERCE.PROCESSING"),
          },
          {
            value: translate("ECOMMERCE.APPROVED"),
            name: translate("ECOMMERCE.APPROVED"),
          },
          {
            value: translate("ECOMMERCE.DISAPPROVED"),
            name: translate("ECOMMERCE.DISAPPROVED"),
          },
        ],
      },
    },
    {
      name: translate("ECOMMERCE.PAYMENT_METHOD"),
      resizable: true,
      sort: true,
      filter: {
        type: "option",
        label: translate("ECOMMERCE.PAYMENT_METHOD"),
        options: [
          {
            value: translate("ECOMMERCE.TICKET"),
            name: translate("ECOMMERCE.TICKET"),
          },
          {
            value: translate("ECOMMERCE.CREDIT_CARD"),
            name: translate("ECOMMERCE.CREDIT_CARD"),
          },
        ],
      },
    },
    {
      name: translate("ECOMMERCE.ORDER_STATUS"),
      resizable: true,
      sort: true,
      filter: {
        type: "option",
        label: translate("ECOMMERCE.ORDER_STATUS"),
        options: [
          {
            value: translate("ECOMMERCE.SENT"),
            name: translate("ECOMMERCE.SENT"),
          },
          {
            value: translate("UI.DELIVERED"),
            name: translate("UI.DELIVERED"),
          },
          {
            value: translate("UI.CANCELED"),
            name: translate("UI.CANCELED"),
          },
        ],
      },
    },
    { name: translate("UI.ACTIONS") },
  ];

  const breadcrumbs = [
    { label: "KwetuPOS", url: "" },
    { label: "eCommerce", url: "" },
    { label: translate("ECOMMERCE.ORDERS") },
  ];

  const paymentStatus = {
    0: {
      name: translate("ECOMMERCE.PROCESSING"),
      class: "default-subtle",
    },
    1: {
      name: translate("ECOMMERCE.APPROVED"),
      class: "success-subtle",
    },
    2: {
      name: translate("ECOMMERCE.DISAPPROVED"),
      class: "danger-subtle",
    },
  };

  const paymentMethod = {
    1: { icon: "barcode", name: translate("ECOMMERCE.TICKET") },
    2: { icon: "credit_card", name: translate("ECOMMERCE.CREDIT_CARD") },
  };

  const orderStatus = {
    0: {
      name: translate("ECOMMERCE.RECEIVED"),
      class: "info-subtle",
    },
    1: {
      name: translate("ECOMMERCE.SENT"),
      class: "warning-subtle",
    },
    2: { name: translate("UI.DELIVERED"), class: "success-subtle" },
    3: { name: translate("UI.CANCELED"), class: "danger-subtle" },
  };

  const orderStatusOptions = [
    { value: 0, label: translate("ECOMMERCE.RECEIVED") },
    { value: 1, label: translate("ECOMMERCE.SENT") },
    { value: 2, label: translate("UI.DELIVERED") },
    { value: 3, label: translate("UI.CANCELED") },
  ];

  const handleCloseModal = () => {
    setOpenModal(false);
    setOrderDetail(null);
    setProductInfo(null);
  };

  return (
    <AppPage title={translate("ECOMMERCE.ORDERS")} breadcrumbs={breadcrumbs}>
      <Container>
        <ContainerItem sm={4} md={8} xl={12}>
          <Table
            title={translate("ECOMMERCE.WISH_LIST")}
            columns={headers}
            identifier="wish_list"
            enableCheckbox={true}
            pagination={true}
            locale={getStorage("lang")?.split("-")?.[0] || "en"}
          >
            {orders.map((order, index) => (
              <Tr key={index}>
                <Td className="weight-600">{order.orderCode}</Td>
                <Td>{format(order.date, "date")}</Td>
                <Td>{format(order.subTotal + order.shipping, "money")}</Td>
                <Td>
                  <Lozenge
                    appearance={paymentStatus[order.paymentStatus].class}
                  >
                    {paymentStatus[order.paymentStatus].name}
                  </Lozenge>
                </Td>
                <Td className="d-flex align-items-center gap-1">
                  <div className="material-symbols-outlined size-20">
                    {paymentMethod[order.paymentMethod].icon}
                  </div>
                  <div>{paymentMethod[order.paymentMethod].name}</div>
                </Td>
                <Td>
                  <Lozenge appearance={orderStatus[order.orderStatus].class}>
                    {orderStatus[order.orderStatus].name}
                  </Lozenge>
                </Td>
                <Td>
                  <div className="d-flex align-items-center">
                    <ActionButton>
                      <span
                        className="material-symbols-outlined size-20"
                        onClick={() => {
                          setOpenModal(true);
                          setOrderDetail(order);
                          setProductInfo(
                            productsJSON?.find(
                              (product) => product.id === order.productId
                            )
                          );
                        }}
                      >
                        visibility
                      </span>
                    </ActionButton>

                    <ActionButton>
                      <span
                        className="material-symbols-outlined size-20"
                        onClick={() => {
                          setSidebarOpened(true);
                          setOrderDetail(order);
                        }}
                      >
                        edit
                      </span>
                    </ActionButton>
                  </div>
                </Td>
              </Tr>
            ))}
          </Table>
        </ContainerItem>
      </Container>

      <Modal
        isOpen={openModal}
        alignment={"center"}
        size={"medium"}
        onClose={handleCloseModal}
      >
        <ModalHeader>{translate("ECOMMERCE.ORDER_DETAILS")}</ModalHeader>
        <ModalBody>
          <div className="d-flex align-items-center gap-1 mb-3">
            <div className="weight-500">
              {translate("ECOMMERCE.REQUEST_CODE")}:
            </div>
            <div>{orderDetail?.orderCode}</div>
          </div>

          <div className="d-flex align-items-center gap-1 mb-3">
            <div className="weight-500">{translate("ECOMMERCE.CLIENT")}:</div>
            <div>Bruna Matarazzo</div>
          </div>

          <div className="d-flex align-items-center gap-1 mb-3">
            <div className="weight-500">
              {translate("ECOMMERCE.FORM_OF_PAYMENT")}:
            </div>
            <div className="d-flex align-items-center gap-1">
              <div>{orderDetail?.paymentMethod === 1 ? "1" : "4"} x </div>
              <div>
                <Lozenge appearance="info-subtle">
                  <div className="material-symbols-outlined size-20">
                    {paymentMethod[orderDetail?.paymentMethod]?.icon}
                  </div>

                  <div>{paymentMethod[orderDetail?.paymentMethod]?.name}</div>
                </Lozenge>
              </div>
            </div>
          </div>

          <div className="d-flex align-items-center gap-1 mb-3">
            <div className="weight-500">
              {translate("ECOMMERCE.PAYMENT_STATUS")}:
            </div>

            <Lozenge appearance={orderStatus[orderDetail?.orderStatus]?.class}>
              {orderStatus[orderDetail?.orderStatus]?.name}
            </Lozenge>
          </div>

          <ListGroup borderless={true}>
            <ListItem>
              <div className="weight-500">{translate("UI.PRODUCT")}:</div>
              <div className="weight-500">{translate("UI.PRICE")}</div>
            </ListItem>

            <ListItem>
              <div className="d-flex align-items-center gap-1">
                <div>
                  <Picture image={productInfo?.image} width={"30px"} />
                </div>
                <div>{productInfo?.name}</div>
              </div>
              <div>{format(productInfo?.price, "money")}</div>
            </ListItem>

            <ListItem>
              <div className="weight-500">Subtotal: </div>
              <div>{format(orderDetail?.subTotal, "money")}</div>
            </ListItem>

            <ListItem>
              <div className="weight-500">
                {translate("ECOMMERCE.FREIGHT")}:{" "}
              </div>
              <div>
                {orderDetail?.shipping > 0
                  ? format(orderDetail.shipping, "money")
                  : translate("ECOMMERCE.FREE")}
              </div>
            </ListItem>

            <ListItem>
              <div className="weight-500">{translate("UI.TOTAL")}: </div>
              <div>
                {format(orderDetail?.subTotal + orderDetail?.shipping, "money")}
              </div>
            </ListItem>
          </ListGroup>
        </ModalBody>
        <ModalFooter></ModalFooter>
      </Modal>

      <SidebarContainer
        title={translate("ECOMMERCE.EDIT_ORDER")}
        show={sidebarOpened}
        onClose={() => setSidebarOpened(false)}
      >
        <div>
          <Input
            type={"text"}
            value={orderDetail?.orderCode}
            label={translate("ECOMMERCE.REQUEST_CODE")}
            disabled={true}
          />
        </div>

        <div>
          <Input
            type={"text"}
            value={"Bruna Matarazzo"}
            label={translate("ECOMMERCE.CLIENT")}
            disabled={true}
          />
        </div>

        <div>
          <Select
            label={translate("ECOMMERCE.ORDER_STATUS")}
            options={orderStatusOptions}
            selected={[orderDetail?.orderStatus]}
            onSelected={(selected) => {}}
            unique={true}
          />
        </div>

        <div>
          <Input
            type={"text"}
            value={orderDetail?.subTotal}
            label={"Subtotal"}
            disabled={true}
          />
        </div>

        <div className="mt-4">
          <Button
            title={translate("UI.SAVE")}
            appearance="primary"
            onClick={() => setSidebarOpened(false)}
          />
        </div>
      </SidebarContainer>
    </AppPage>
  );
};

export default Orders;
