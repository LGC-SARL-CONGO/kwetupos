import React, { useState } from "react";
import { useNavigate } from "react-router-dom";

import { translate } from "../../../../hooks/translate";
import useDateFormat from "../../../../hooks/useDateFormat";
import { useLocalStorage } from "../../../../hooks/useLocalStorage";


import AppPage from "../../../../components/CustomUI/AppPage";
import Container from "../../../../components/CustomUI/Container";
import ContainerItem from "../../../../components/CustomUI/Container/ContainerItem";
import { Table, Tr, Td } from "../../../../components/BaseUI/Table";
import Date from "../../../../components/CustomUI/Date";
import {
    Modal,
    ModalHeader,
    ModalBody,
    ModalFooter,
} from "../../../../components/BaseUI/Modal";
import SidebarContainer from "../../../../components/CustomUI/SidebarContainer";
import Input from "../../../../components/BaseUI/Input";
import Select from "../../../../components/BaseUI/Select";
import Button from "../../../../components/BaseUI/Button";
import Avatar from "../../../../components/CustomUI/Avatar";
import ActionButton from "../../../../components/CustomUI/ActionButton";
import DatePicker from "../../../../components/CustomUI/DatePicker";

import customersJSON from "../../../../mocks/customers.json";
import Label from "../../../../components/BaseUI/Label";
import ButtonGroup from "../../../../components/BaseUI/ButtonGroup";

export default function Customers() {
    const [customers, setCustomers] = useState(customersJSON);
    const [openModal, setOpenModal] = useState(false);
    const [customerDetail, setCustomerDetail] = useState(null);
    const [sidebarOpened, setSidebarOpened] = useState(false);
    const [createCustomer, setCreateCustomer] = useState(false);

    const navigate = useNavigate()
    const { getStorage } = useLocalStorage()

    const headers = [
        { name: translate("UI.NAME"), resizable: true },
        { name: "Email", resizable: true },
        { name: translate("UI.TELEPHONE"), resizable: true },
        { name: translate("UI.ACTIONS") },
    ];

    const breadcrumbs = [
        { label: "Magnun", url: "" },
        { label: "eCommerce", url: "" },
        { label: translate("ECOMMERCE.CUSTOMERS") },
    ];
    const sexOptions = [
        { value: "Femile", label: translate("UI.FEMININE") },
        { value: "Male", label: translate("UI.MASCULINE") },
    ];

    const handleCloseModal = () => {
        setOpenModal(false);
        setCustomerDetail(null);
    };

    return (
        <AppPage
            title={translate("ECOMMERCE.CUSTOMERS")}
            breadcrumbs={breadcrumbs}
            actions={<Button appearance='primary' onClick={() => setCreateCustomer(true)}>{translate('ECOMMERCE.ADD_CUSTOMER')}</Button>}
        >
            <Container>
                <ContainerItem sm={4} md={8} xl={12}>
                    <Table
                        title={translate("ECOMMERCE.CUSTOMER_LIST")}
                        columns={headers}
                        identifier="customer_list"
                        pagination={true}
                        enableCheckbox={true}
                        locale={getStorage('lang')?.split('-')?.[0] || 'en'}
                    >
                        {customers.map((customer, index) => (
                            <Tr key={index}>
                                <Td className="d-flex align-items-center gap-1">
                                    <Avatar
                                        src={customer?.image}
                                        name={customer?.name}
                                        size='small'
                                    />

                                    <div>{customer.name}</div>
                                </Td>
                                <Td>{customer.email}</Td>
                                <Td>{customer.phone}</Td>
                                <Td>
                                    <div className="d-flex align-items-center">
                                        <ActionButton>
                                            <span
                                                className="material-symbols-outlined size-20"
                                                onClick={() => {
                                                    setOpenModal(true);
                                                    setCustomerDetail(customer);
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
                                                    setCustomerDetail(customer);
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

            <Modal isOpen={openModal} alignment={"center"} size={"medium"} onClose={handleCloseModal}>
                <ModalHeader>
                    {translate("ECOMMERCE.CLIENTS_DATA")}
                </ModalHeader>
                <ModalBody>
                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">
                            {translate("UI.NAME")}:
                        </div>
                        <div>{customerDetail?.name}</div>
                    </div>

                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">CPF:</div>
                        <div>{customerDetail?.cpf}</div>
                    </div>

                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">
                            {translate("UI.DATE_OF_BIRTH")}:
                        </div>
                        <div>
                            <Date value={customerDetail?.dateOfBirth} />
                        </div>
                    </div>

                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">
                            {translate("UI.SEX")}:
                        </div>
                        <div>{customerDetail?.sex}</div>
                    </div>

                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">Email:</div>
                        <div>{customerDetail?.email}</div>
                    </div>

                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">
                            {translate("UI.TELEPHONE")}:
                        </div>
                        <div>{customerDetail?.phone}</div>
                    </div>

                    <div className="d-flex align-items-center gap-1 mb-3">
                        <div className="weight-500">
                            {translate("UI.ADDRESS")}:
                        </div>
                        <div>
                            {customerDetail?.address},{" "}
                            {customerDetail?.neighborhood},{" "}
                            {customerDetail?.number}, {customerDetail?.city}/
                            {customerDetail?.state} - {customerDetail?.zipCode}
                        </div>
                    </div>
                </ModalBody>
                <ModalFooter></ModalFooter>
            </Modal>

            <Modal isOpen={createCustomer} alignment={"center"} size={"medium"} onClose={() => setCreateCustomer(false)}>
                <ModalHeader>{translate('ECOMMERCE.ADD_CUSTOMER')}</ModalHeader>
                <ModalBody>
                    <Avatar selection size='large'/>

                    <div className="py-2"></div>

                    <Input label={translate('UI.FULL_NAME')} type='text' required/>
                    <div className="py-2"></div>

                    <Input label='E-mail' type='text' required />
                    <div className="py-2"></div>

                    <Input label={translate("UI.TELEPHONE")} type='text' required />
                    <div className="py-2"></div>

                    <Input label={translate("UI.ADDRESS")} type='text' required />
                    <div className="py-2"></div>
                
                    <DatePicker
                        label={translate("UI.DATE_OF_BIRTH")}
                        required
                     />
                </ModalBody>
                <ModalFooter>
                    <ButtonGroup placement='end'>
                        <Button appearance='primary'>{translate("UI.SAVE")}</Button>
                    </ButtonGroup>
                </ModalFooter>
            </Modal>

            <SidebarContainer
                title={translate("ECOMMERCE.EDIT_CUSTOMER")}
                show={sidebarOpened}
                onClose={() => setSidebarOpened(false)}
            >
                <div>
                    <Input
                        type={"text"}
                        label={translate("UI.NAME")}
                        value={customerDetail?.name}
                    />
                </div>

                <div>
                    <Input
                        type={"text"}
                        label={"CPF"}
                        value={customerDetail?.cpf}
                    />
                </div>

                <div>
                    <Input
                        type={"email"}
                        label={"Email"}
                        value={customerDetail?.email}
                    />
                </div>

                <div className="mb-3">
                    <DatePicker 
                        label={translate("UI.DATE_OF_BIRTH")}
                        value={useDateFormat(customerDetail?.dateOfBirth)}
                    />
                </div>

                <div>
                    <Input
                        type={"text"}
                        label={translate("UI.TELEPHONE")}
                        value={customerDetail?.phone}
                    />
                </div>

                <div>
                    <Select
                        label={translate("UI.SEX")}
                        options={sexOptions}
                        selected={[customerDetail?.sex]}
                        unique={true}
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
}
