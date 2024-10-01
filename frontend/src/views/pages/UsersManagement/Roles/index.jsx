import React, { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom"; // Utilisation du hook useNavigate
import AppPage from "../../../../components/CustomUI/AppPage";
import Button from "../../../../components/BaseUI/Button";
import { translate } from "../../../../hooks/translate";
import Container from "../../../../components/CustomUI/Container";
import { Table, Tr, Td } from "../../../../components/BaseUI/Table";
import ContainerItem from "../../../../components/CustomUI/Container/ContainerItem";
import axiosInstance from "../../../../axios";
import SidebarContainer from "../../../../components/CustomUI/SidebarContainer";
import { Toast, ToastContainer } from "../../../../components/CustomUI/Toast";
import { useLocalStorage } from "../../../../hooks/useLocalStorage";
import ActionButton from "../../../../components/CustomUI/ActionButton";
import { useAuth } from "./../../../../services/useAuth";

export default function Roles() {
  const [rolesData, setRolesData] = useState([]);
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);
  const navigate = useNavigate(); // Hook pour la navigation
  const { getStorage } = useLocalStorage();
  const [sidebarOpened, setSidebarOpened] = useState(false);
  const [roleInfo, setRoleInfo] = useState({});
  const [toasts, setToasts] = useState([]);
  const { user } = useAuth(); // Récupération des infos utilisateur

  useEffect(() => {
    const fetchRoles = async () => {
      try {
        const response = await axiosInstance.get("/api/roles");
        console.log("Response data:", response.data.data); // Affiche la réponse pour le débogage

        if (Array.isArray(response.data.data)) {
          setRolesData(response.data.data);
        } else {
          throw new Error("Data is not in the expected format");
        }
      } catch (err) {
        setError(err);
      } finally {
        setLoading(false);
      }
    };

    fetchRoles();
  }, []);

  const headers = [
    {
      name: translate("MENU.ROLE"),
      resizable: true,
      sort: true,
      filter: { type: "text", label: translate("UI.USER_NAME"), options: [] },
    },
    {
      name: translate("UI.ACTION"),
      resizable: true,
      sort: false,
      filter: { type: "text", label: translate("UI.ACTION"), options: [] },
    },
  ];

  const removeToast = (index) => {
    const values = toasts;
    values.splice(index, 1);

    setToasts([...values]);
  };

  const extractRoleName = (roleString) => {
    // Sépare la chaîne du rôle par le # et retourne la première partie
    return roleString.split("#")[0];
  };

  const handleUserInfo = (product) => {
    setSidebarOpened(true);
    setRoleInfo(product);
  };

  const deleteUser = (id) => {
    // Logique pour supprimer un rôle (à compléter)
  };

  // Filtrer les rôles par business_id
  const filteredRoles = rolesData.filter(
    (role) => role.business_id === user.business_id
  );

  return (
    <AppPage
      title="Roles"
      actions={
        <Button
          appearance="primary"
          onClick={() => navigate("/dashboard/role/create")} // Utilisation de navigate pour la redirection
        >
          {translate("ECOMMERCE.ADD_ROLE")}{" "}
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
            {/* Rend les lignes du tableau */}
            {loading ? (
              <Tr>
                <Td colSpan={headers.length}>Loading...</Td>
              </Tr>
            ) : error ? (
              <Tr>
                <Td colSpan={headers.length}>Error: {error.message}</Td>
              </Tr>
            ) : filteredRoles.length > 0 ? (
              filteredRoles.map((role) => (
                <Tr key={role.id} id={role.id}>
                  <Td>{extractRoleName(role.name) || "N/A"}</Td>
                  <Td>
                    <div className="d-flex align-items-center gap-1 u-pointer">
                      <ActionButton onClick={() => handleUserInfo(role)}>
                        <span className="material-symbols-outlined size-20">
                          {translate("UI.EDIT")}
                        </span>
                      </ActionButton>
                      <ActionButton onClick={() => deleteUser(role.id)}>
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
                <Td colSpan={headers.length}>No roles found</Td>
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
