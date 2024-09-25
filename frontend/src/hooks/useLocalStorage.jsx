export const useLocalStorage = () => {
  // Récupère une valeur stockée
  const getStorage = (key) => {
    const saved = localStorage.getItem(key);
    return saved ? JSON.parse(saved) : null;
  };

  // Persiste une valeur dans le localStorage
  const persistStorage = (key, value) => {
    // On ne nettoie pas avant de stocker; on écrase la valeur si elle existe
    localStorage.setItem(key, JSON.stringify(value));
  };

  // Efface une valeur du localStorage
  const clearStorage = (key) => {
    localStorage.removeItem(key);
  };

  return {
    getStorage,
    persistStorage,
    clearStorage,
  };
};
