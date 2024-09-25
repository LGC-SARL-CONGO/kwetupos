import React, { useEffect, useState } from "react";
import { translate } from "../../../../../hooks/translate";
import AppPage from "../../../../../components/CustomUI/AppPage";
import Container from "../../../../../components/CustomUI/Container";
import ContainerItem from "../../../../../components/CustomUI/Container/ContainerItem";
import CardContainer from "../../../../../components/CustomUI/CardContainer";
import Input from "../../../../../components/BaseUI/Input";
import Select from "../../../../../components/BaseUI/Select";
import Button from "../../../../../components/BaseUI/Button";
import ButtonGroup from "../../../../../components/BaseUI/ButtonGroup";
import axiosInstance from "../../../../../axios";
import { useAuth } from "../../../../../services/useAuth";

// Composant pour l'option de préfixe (Mr, Mrs, etc.)
const CreatePrefixOption = () => {
  return (
    <ContainerItem sm={4} md={4} xl={3}>
      <Select
        label={translate("PROFILE.PREFIX")}
        options={[
          { value: 1, label: "Mr" },
          { value: 2, label: "Mrs" },
          { value: 3, label: "Miss" },
        ]}
        selected={[]}
        unique
      />
    </ContainerItem>
  );
};

export default function CreateUser() {
  const [rolesData, setRolesData] = useState([]);
  const { user } = useAuth();
  const [error, setError] = useState(null);
  const [prefixOptions, setPrefixOptions] = useState([
    <CreatePrefixOption key={0} />,
  ]);
  const [data, setData] = useState({
    firstName: "",
    business_id: "",
    language: "",
    surname: "",
    lastName: "",
    email: "",
    username: "",
    password: "",
    confirmPassword: "",
    role: "user",
    dateOfBirth: "",
    gender: "",
    maritalStatus: "",
    bloodGroup: "",
    mobileNumber: "",
    alternateContactNumber: "",
    familyContactNumber: "",
    accountHolderName: "",
    accountNumber: "",
    bankName: "",
    bankIdentifierCode: "",
    branch: "",
    taxPayerId: "",
  });

  useEffect(() => {
    const fetchRoles = async () => {
      try {
        const response = await axiosInstance.get("/api/roles");
        if (Array.isArray(response.data.data)) {
          setRolesData(response.data.data);
        } else {
          throw new Error("Data is not in the expected format");
        }
      } catch (err) {
        setError(err.message);
      }
    };

    fetchRoles();
  }, []);

  const extractRoleName = (roleString) => {
    return roleString.split("#")[0];
  };

  const addPrefixOption = () => {
    const newPrefixOptions = [
      ...prefixOptions,
      <CreatePrefixOption key={prefixOptions.length} />,
    ];
    setPrefixOptions(newPrefixOptions);
  };

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setData({
      ...data,
      [name]: value,
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await axiosInstance.post("/api/users/create", data);
      console.log("User created:", response.data);
    } catch (err) {
      console.error("Error creating user:", err);
      setError("Failed to create user.");
    }
  };

  return (
    <AppPage title={translate("UI.ADD_USER")}>
      <form onSubmit={handleSubmit}>
        <CardContainer title={translate("PROFILE.USER_INFORMATION")}>
          <Container className="p-3">
            {prefixOptions}
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.FIRST_NAME")}
                type="text"
                name="firstName"
                value={data.firstName}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.LAST_NAME")}
                type="text"
                name="lastName"
                value={data.lastName}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("EMAIL.EMAIL")}
                type="email"
                name="email"
                value={data.email}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
          </Container>
        </CardContainer>

        <div className="my-2"></div>

        <CardContainer title={translate("PROFILE.ROLES_AND_PERMISSIONS")}>
          <Container className="p-3">
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("AUTHENTICATION.USERNAME")}
                type="text"
                name="username"
                value={data.username}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("AUTHENTICATION.PASSWORD")}
                type="password"
                name="password"
                value={data.password}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("AUTHENTICATION.CONFIRM_PASSWORD")}
                type="password"
                name="confirmPassword"
                value={data.confirmPassword}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Select
                label={translate("PROFILE.USER_ROLE")}
                options={
                  rolesData.length > 0
                    ? rolesData.map((role) => ({
                        value: role.id,
                        label: extractRoleName(role.name),
                      }))
                    : []
                }
                selected={[]}
                unique
                onChange={(value) => setData({ ...data, role: value })}
              />
            </ContainerItem>
          </Container>
        </CardContainer>

        <div className="my-2"></div>

        <CardContainer title={translate("PROFILE.MORE_INFORMATION")}>
          <Container className="p-3">
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.DATE_OF_BIRTH")}
                type="date"
                name="dateOfBirth"
                value={data.dateOfBirth}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Select
                label={translate("PROFILE.GENDER")}
                options={[
                  { value: "male", label: translate("PROFILE.MALE") },
                  { value: "female", label: translate("PROFILE.FEMALE") },
                  { value: "other", label: translate("PROFILE.OTHER") },
                ]}
                selected={data.gender}
                unique
                onChange={(value) => setData({ ...data, gender: value })}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Select
                label={translate("PROFILE.MARITAL_STATUS")}
                options={[
                  { value: "single", label: translate("PROFILE.SINGLE") },
                  { value: "married", label: translate("PROFILE.MARRIED") },
                  { value: "divorced", label: translate("PROFILE.DIVORCED") },
                  { value: "widowed", label: translate("PROFILE.WIDOWED") },
                ]}
                selected={data.maritalStatus}
                unique
                onChange={(value) => setData({ ...data, maritalStatus: value })}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.BLOOD_GROUP")}
                type="text"
                name="bloodGroup"
                value={data.bloodGroup}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("CONTACT.MOBILE_NUMBER")}
                type="tel"
                name="mobileNumber"
                value={data.mobileNumber}
                onChange={handleInputChange}
                required
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("CONTACT.ALTERNATE_CONTACT_NUMBER")}
                type="tel"
                name="alternateContactNumber"
                value={data.alternateContactNumber}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("CONTACT.FAMILY_CONTACT_NUMBER")}
                type="tel"
                name="familyContactNumber"
                value={data.familyContactNumber}
                onChange={handleInputChange}
              />
            </ContainerItem>
          </Container>
        </CardContainer>

        <div className="my-2"></div>

        <CardContainer title={translate("PROFILE.BANK_DETAILS")}>
          <Container className="p-3">
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.ACCOUNT_HOLDER_NAME")}
                type="text"
                name="accountHolderName"
                value={data.accountHolderName}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.ACCOUNT_NUMBER")}
                type="text"
                name="accountNumber"
                value={data.accountNumber}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.BANK_NAME")}
                type="text"
                name="bankName"
                value={data.bankName}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.BANK_IDENTIFIER_CODE")}
                type="text"
                name="bankIdentifierCode"
                value={data.bankIdentifierCode}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.BRANCH")}
                type="text"
                name="branch"
                value={data.branch}
                onChange={handleInputChange}
              />
            </ContainerItem>
            <ContainerItem sm={4} md={4} xl={4}>
              <Input
                label={translate("PROFILE.TAX_PAYER_ID")}
                type="text"
                name="taxPayerId"
                value={data.taxPayerId}
                onChange={handleInputChange}
              />
            </ContainerItem>
          </Container>
        </CardContainer>

        <div className="my-2"></div>

        <CardContainer>
          <div className="p-3">
            {error && <div className="alert alert-danger">{error}</div>}
            <ButtonGroup placement="end">
              <Button appearance="soft">{translate("UI.DISCARD")}</Button>
              <Button appearance="primary" type="submit">
                {translate("UI.SAVE")}
              </Button>
            </ButtonGroup>
          </div>
        </CardContainer>
      </form>
    </AppPage>
  );
}
