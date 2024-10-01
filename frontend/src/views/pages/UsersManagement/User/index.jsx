import React, { useState, useEffect } from "react";
import AppPage from "../../../../components/CustomUI/AppPage";
import axiosInstance from "./../../../../axios";
import { Link, useNavigate } from "react-router-dom"; // Utilisation de useNavigate pour la redirection
import Container from "../../../../components/CustomUI/Container";
import ContainerItem from "../../../../components/CustomUI/Container/ContainerItem";
import { Table, Tr, Td } from "../../../../components/BaseUI/Table";
import { translate } from "../../../../hooks/translate";
import { useLocalStorage } from "../../../../hooks/useLocalStorage";
import Button from "../../../../components/BaseUI/Button";
import ActionButton from "../../../../components/CustomUI/ActionButton";
import SidebarContainer from "../../../../components/CustomUI/SidebarContainer";
import { Toast, ToastContainer } from "../../../../components/CustomUI/Toast";

export default function User() {
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const { getStorage } = useLocalStorage();
  const [sidebarOpened, setSidebarOpened] = useState(false);
  const [productInfo, setProductInfo] = useState({});
  const [toasts, setToasts] = useState([]);
  const navigate = useNavigate(); // Utilisation de useNavigate

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const response = await axiosInstance.get("/api/users");
        console.log("Response data:", response.data.data); // Affiche la réponse pour le débogage

        if (Array.isArray(response.data.data)) {
          setUsers(response.data.data);
        } else {
          throw new Error("Data is not in the expected format");
        }
      } catch (err) {
        setError(err);
      } finally {
        setLoading(false);
      }
    };

    fetchUsers();
  }, []);

  const handleDelete = async (id) => {
    if (window.confirm("Are you sure you want to delete this user?")) {
      try {
        await axiosInstance.delete(`/api/users/${id}`);
        setUsers((prevUsers) => prevUsers.filter((user) => user.id !== id));
      } catch (err) {
        setError(err);
      }
    }
  };

  const extractRoleName = (roleString) => {
    return roleString.split("#")[0];
  };

  const usersActions = [
    { name: translate("UI.ADD"), to: "", redirect: false },
    { name: translate("UI.IMPORT"), to: "", redirect: false },
    { name: translate("UI.EXPORT"), to: "", redirect: false },
  ];

  const headers = [
    {
      name: translate("User Name"),
      resizable: true,
      sort: true,
      filter: { type: "text", label: translate("UI.USER_NAME"), options: [] },
    },
    {
      name: translate("UI.FULL_NAME"),
      resizable: true,
      sort: true,
      filter: { type: "text", label: translate("UI.FULL_NAME"), options: [] },
    },
    {
      name: translate("ROLE"),
      resizable: true,
      sort: true,
      filter: { type: "text", label: translate("UI.ROLE"), options: [] },
    },
    {
      name: "Email",
      resizable: true,
      sort: true,
      filter: { type: "text", label: translate("EMAIL"), options: [] },
    },
    {
      name: translate("ACTION"),
      resizable: true,
      sort: false,
      filter: { type: "text", label: translate("UI.ACTION"), options: [] },
    },
  ];

  const breadcrumbs = [
    { label: "KwetuPOS", url: "" },
    { label: "User", url: "" },
  ];

  const handleUserInfo = (product) => {
    setSidebarOpened(true);
    setProductInfo(product);
  };

  const deleteUser = (id) => {
    // const product = users?.find((product) => product.id === id);
    // const index = users?.findIndex((product) => product.id === id);
    // const values = users;
    // values?.splice(index, 1);
    // setProducts([...values]);
    // setToasts([
    //   {
    //     description: `The product "${product?.name}" has been successfully deleted from the system.`,
    //     id: id,
    //     key: id,
    //     title: "Product successfully deleted!",
    //     appearance: "success",
    //   },
    //   ...toasts,
    // ]);
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
      title="Users"
      breadcrumbs={breadcrumbs}
      actions={
        <Button
          appearance="primary"
          onClick={() => navigate("/dashboard/users/create")} // Utilisation de navigate pour rediriger
        >
          {translate("ECOMMERCE.ADD_PRODUCT")}
        </Button>
      }
    >
      <Container>
        <ContainerItem sm={4} md={8} xl={12}>
          <Table
            title={translate("All Users")}
            columns={headers}
            identifier="users_list"
            enableCheckbox={true}
            locale={getStorage("lang")?.split("-")?.[0] || "en"}
            pagination={true}
          >
            {loading ? (
              <Tr>
                <Td colSpan={headers.length}>Loading...</Td>
              </Tr>
            ) : error ? (
              <Tr>
                <Td colSpan={headers.length}>Error: {error.message}</Td>
              </Tr>
            ) : users.length > 0 ? (
              users.map((user) => (
                <Tr key={user.id} id={user.id}>
                  <Td>{user.username}</Td>
                  <Td>{user.full_name || "N/A"}</Td>
                  <Td>{extractRoleName(user.roles[0]) || "N/A"}</Td>
                  <Td>{user.email}</Td>
                  <Td>
                    <div className="d-flex align-items-center gap-1 u-pointer">
                      <ActionButton onClick={() => handleUserInfo(user)}>
                        <span className="material-symbols-outlined size-20">
                          {translate("UI.EDIT")}
                        </span>
                      </ActionButton>
                      <ActionButton onClick={() => deleteUser(user.id)}>
                        <span className="material-symbols-outlined size-20">
                          {translate("UI.DELETE")}
                        </span>
                      </ActionButton>
                    </div>
                  </Td>
                </Tr>
              ))
            ) : (
              <Tr>
                <Td colSpan={headers.length}>No users found</Td>
              </Tr>
            )}
          </Table>
        </ContainerItem>
      </Container>

      <SidebarContainer></SidebarContainer>
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
}
