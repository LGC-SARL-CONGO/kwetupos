import axios from "axios";

// Créez une instance Axios avec la configuration de base
const axiosInstance = axios.create({
  baseURL: "https://app.kwetupos.com", // URL par défaut
  headers: {
    "Content-Type": "application/json",
  },
});

// Intercepteur de requêtes pour ajouter le token d'authentification
axiosInstance.interceptors.request.use(
  (config) => {
    const token = JSON.parse(localStorage.getItem("personalToken"))?.value;
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

// Intercepteur de réponse pour gérer les erreurs globalement
axiosInstance.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error(
      "Erreur API:",
      error.response ? error.response.data : error.message
    );
    return Promise.reject(error);
  }
);

export default axiosInstance;
