import { useState, useEffect, useCallback } from "react";
import moment from "moment";
import axios from "axios";
import { useLocalStorage } from "../hooks/useLocalStorage";

export const useAuth = () => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState(null); // État pour stocker les données utilisateur
  const { getStorage, persistStorage, clearStorage } = useLocalStorage();
  const apiUrl = process.env.REACT_APP_API_URL;

  // Fonction pour vérifier l'authentification
  const auth = useCallback(async () => {
    const now = moment().valueOf();
    const storage = getStorage("personalToken");
    const userData = getStorage("userData");

    // Vérifier si le token ou les données utilisateur sont expirés ou absents
    if (!storage || now > storage.expires || !userData) {
      return false;
    }

    try {
      const response = await axios.get(`${apiUrl}/api/user`, {
        withCredentials: true,
        headers: { Authorization: `Bearer ${storage.value}` },
      });

      if (response.status === 200 && response.data) {
        setUser(response.data); // Mettre à jour les données utilisateur
        persistStorage("userData", response.data); // Persist user data in localStorage
        return true;
      } else {
        return false;
      }
    } catch (error) {
      console.error("Erreur d'authentification :", error);
      return false;
    }
  }, [apiUrl, getStorage, persistStorage]);

  // Fonction pour se connecter
  const login = useCallback(
    async (email, password) => {
      try {
        const response = await axios.post(
          `${apiUrl}/api/auth/login`,
          { username: email, password },
          { withCredentials: true }
        );

        if (response.data.success && response.data.token) {
          // Stocker le token dans localStorage
          persistStorage("personalToken", {
            expires: moment().add(7, "days").valueOf(),
            value: response.data.token,
          });

          // Stocker les données utilisateur dans localStorage
          persistStorage("userData", response.data.user);
          setUser(response.data.user); // Mettre à jour l'état utilisateur
          setIsAuthenticated(true);
          return true;
        } else {
          console.error("Échec de la connexion :", response.data.message);
          return false;
        }
      } catch (error) {
        console.error("Erreur lors de la connexion :", error);
        return false;
      }
    },
    [apiUrl, persistStorage]
  );

  // Fonction pour se déconnecter
  const logout = useCallback(async () => {
    try {
      const token = getStorage("personalToken");
      if (!token) {
        setIsAuthenticated(false);
        setUser(null); // Effacer l'utilisateur de l'état
        return true;
      }

      await axios.post(
        `${apiUrl}/api/logout`,
        {},
        {
          withCredentials: true,
          headers: { Authorization: `Bearer ${token.value}` },
        }
      );

      // Effacer le token et les données utilisateur du localStorage
      clearStorage("personalToken");
      clearStorage("userData");
      setIsAuthenticated(false);
      setUser(null); // Effacer les données utilisateur

      return true;
    } catch (error) {
      console.error("Erreur lors de la déconnexion :", error);
      return false;
    }
  }, [apiUrl, getStorage, clearStorage]);

  // Au montage, restaurer l'authentification si le token et les données utilisateur sont présents dans le localStorage
  useEffect(() => {
    const storedUser = getStorage("userData"); // Récupérer les données utilisateur stockées
    if (storedUser) {
      setUser(storedUser); // Restaurer les données utilisateur
      setIsAuthenticated(true); // Considérer l'utilisateur comme authentifié si des données sont présentes
    } else {
      (async () => {
        const authenticated = await auth();
        setIsAuthenticated(authenticated);
      })();
    }
  }, []);

  return { isAuthenticated, user, login, logout, auth };
};
