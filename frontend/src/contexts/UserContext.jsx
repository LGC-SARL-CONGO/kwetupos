import React, { createContext, useState, useEffect, useContext } from "react";
import axiosInstance from "../axios";
import { useAuth } from "../services/useAuth";
import { useLocalStorage } from "../hooks/useLocalStorage";

// Créez le contexte
const UserContext = createContext();

// Créez le fournisseur de contexte
export const UserProvider = ({ children }) => {
  const [user, setUser] = useState(null);
  const [loading, setLoading] = useState(true);
  const { isAuthenticated } = useAuth(); // Utilisez le hook pour vérifier l'authentification
  const { clearStorage } = useLocalStorage();

  // Fonction pour récupérer les données utilisateur
  const fetchUserData = async () => {
    try {
      const response = await axiosInstance.get("/api/user");
      setUser(response.data);
    } catch (error) {
      console.error(
        "Erreur lors de la récupération des données utilisateur:",
        error.message
      );
      setUser(null);
    } finally {
      setLoading(false);
    }
  };

  // Fonction pour mettre à jour les données utilisateur
  const updateUserData = async (userData) => {
    try {
      const response = await axiosInstance.put("/api/user", userData);
      console.log("User data updated:", response.data);
      setUser(response.data);
      return { success: true };
    } catch (error) {
      console.error(
        "Erreur lors de la mise à jour des données utilisateur:",
        error.message
      );
      return { success: false, message: "Erreur lors de la mise à jour." };
    }
  };

  useEffect(() => {
    console.log("Auth status changed:", isAuthenticated);
    if (isAuthenticated) {
      fetchUserData();
    } else {
      setUser(null);
      setLoading(false);
    }
  }, [isAuthenticated]);

  return (
    <UserContext.Provider value={{ user, loading, updateUserData }}>
      {children}
    </UserContext.Provider>
  );
};

// Hook personnalisé pour utiliser le contexte
export const useUser = () => {
  const context = useContext(UserContext);
  if (!context) {
    throw new Error("useUser doit être utilisé à l'intérieur de UserProvider");
  }
  return context;
};
