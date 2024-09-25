import React, { useState } from "react";
import { translate } from "../../../../../hooks/translate";
import AppPage from "../../../../../components/CustomUI/AppPage";
import CardContainer from "../../../../../components/CustomUI/CardContainer";
import Button from "../../../../../components/BaseUI/Button";
import ButtonGroup from "../../../../../components/BaseUI/ButtonGroup";
import axiosInstance from "../../../../../axios";
import { useAuth } from "../../../../../services/useAuth";

// Import RolePermission components
import Others from "./RolePermissions/Other";
import User from "./RolePermissions/User";
import Roles from "./RolePermissions/Roles";
import Supplier from "./RolePermissions/Supplier";
import Customer from "./RolePermissions/Customer";
import Product from "./RolePermissions/Product";
import Purchase from "./RolePermissions/Purchase";
import Pos from "./RolePermissions/Pos";
import Sell from "./RolePermissions/Sell";
import Draft from "./RolePermissions/Draft";
import Quotation from "./RolePermissions/Quotation";
import Shipments from "./RolePermissions/Shipments";
import CashRegister from "./RolePermissions/CashRegister";
import Brand from "./RolePermissions/Brand";
import TaxRate from "./RolePermissions/TaxRate";
import Unit from "./RolePermissions/Unit";
import Category from "./RolePermissions/Category";
import Report from "./RolePermissions/Report";
import Settings from "./RolePermissions/Settings";
import Expense from "./RolePermissions/Expense";
import Home from "./RolePermissions/Home";
import Account from "./RolePermissions/Account";
import Bookings from "./RolePermissions/Bookings";
import AccessSelling from "./RolePermissions/AccessSelling";
import Repair from "./RolePermissions/Repair";
import Superadmin from "./RolePermissions/Superadmin";

const roleComponentsList = [
  { component: Others, title: "ROLE_PERMISSIONS.OTHERS" },
  { component: User, title: "ROLE_PERMISSIONS.USER" },
  { component: Roles, title: "ROLE_PERMISSIONS.ROLES" },
  { component: Supplier, title: "ROLE_PERMISSIONS.SUPPLIER" },
  { component: Customer, title: "ROLE_PERMISSIONS.CUSTOMER" },
  { component: Product, title: "ROLE_PERMISSIONS.PRODUCT" },
  { component: Purchase, title: "ROLE_PERMISSIONS.PURCHASE" },
  { component: Pos, title: "ROLE_PERMISSIONS.POS" },
  { component: Sell, title: "ROLE_PERMISSIONS.SELL" },
  { component: Draft, title: "ROLE_PERMISSIONS.DRAFT" },
  { component: Quotation, title: "ROLE_PERMISSIONS.QUOTATION" },
  { component: Shipments, title: "ROLE_PERMISSIONS.SHIPMENTS" },
  { component: CashRegister, title: "ROLE_PERMISSIONS.CASH_REGISTER" },
  { component: Brand, title: "ROLE_PERMISSIONS.BRAND" },
  { component: TaxRate, title: "ROLE_PERMISSIONS.TAX_RATE" },
  { component: Unit, title: "ROLE_PERMISSIONS.UNIT" },
  { component: Category, title: "ROLE_PERMISSIONS.CATEGORY" },
  { component: Report, title: "ROLE_PERMISSIONS.REPORT" },
  { component: Settings, title: "ROLE_PERMISSIONS.SETTINGS" },
  { component: Expense, title: "ROLE_PERMISSIONS.EXPENSE" },
  { component: Home, title: "ROLE_PERMISSIONS.HOME" },
  { component: Account, title: "ROLE_PERMISSIONS.ACCOUNT" },
  { component: Bookings, title: "ROLE_PERMISSIONS.BOOKINGS" },
  { component: AccessSelling, title: "ROLE_PERMISSIONS.ACCESS_SELLING" },
  { component: Repair, title: "ROLE_PERMISSIONS.REPAIR" },
  { component: Superadmin, title: "ROLE_PERMISSIONS.SUPERADMIN" },
];

export default function CreateRole() {
  const { user } = useAuth();
  const [error, setError] = useState(null);
  const [rolesData, setRolesData] = useState({});

  const handleSelectionChange = (data) => {
    setRolesData((prevRolesData) => ({
      ...prevRolesData,
      ...data,
    }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    console.log("Role created:", rolesData);
    // try {
    //   const response = await axiosInstance.post("/api/roles/create", rolesData);
    //   console.log("Role created:", response.data);
    //   setError(null);
    // } catch (err) {
    //   console.error("Error creating role:", err);
    //   setError(err.response?.data?.message || "Failed to create role.");
    // }
  };

  return (
    <AppPage title={translate("UI.ADD_ROLE")}>
      <form onSubmit={handleSubmit}>
        {roleComponentsList.map(
          ({ component: RoleComponent, title }, index) => (
            <React.Fragment key={index}>
              <CardContainer title={translate(title)}>
                <RoleComponent onSelectionChange={handleSelectionChange} />
              </CardContainer>
              {index < roleComponentsList.length - 1 && (
                <div className="my-2" />
              )}
            </React.Fragment>
          )
        )}

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
