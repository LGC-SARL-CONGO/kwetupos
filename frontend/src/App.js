import React, { Suspense, useEffect } from "react";
import { HashRouter, Route, Routes, Outlet, Navigate } from "react-router-dom";
import moment from "moment";

import ThemeProvider from "./contexts/theme";
import Login from "./views/auth/Login";
import Register from "./views/auth/Register";
import RecoverPassword from "./views/auth/RecoverPassword";
import LockScreen from "./views/auth/LockScreen";
import ConfirmEmail from "./views/auth/ConfirmEmail";
import EmailVerification from "./views/auth/EmailVerification";
import Page404 from "./views/pages/Page404";
import Page500 from "./views/pages/Page500";
import { UserProvider } from "./contexts/UserContext";

// Lazy load the DefaultLayout component
const DefaultLayout = React.lazy(() => import("./layout/Default"));

// Loading component to display during lazy loading
const loading = (
  <div className="pt-3 text-center">
    <div className="sk-spinner sk-spinner-pulse"></div>
  </div>
);

// Authentication function to check if the user is authenticated
const isAuthenticated = () => {
  const now = moment().valueOf();
  const storage = JSON.parse(localStorage.getItem("personalToken")) || null;
  if (!storage) return false;
  if (now > storage.expires) {
    localStorage.removeItem("personalToken");
    return false;
  }

  return true;
};

// PrivateRoutes component to handle authenticated routes
const PrivateRoutes = () =>
  isAuthenticated() ? <Outlet /> : <Navigate to="/login" />;

const App = () => {
  return (
    <ThemeProvider>
      <HashRouter>
        <UserProvider>
          <Suspense fallback={loading}>
            <Routes>
              <Route element={<PrivateRoutes />}>
                <Route path="*" element={<DefaultLayout />} />
              </Route>
              <Route path="/login" element={<Login />} />
              <Route path="/register" element={<Register />} />
              <Route path="/recover-password" element={<RecoverPassword />} />
              <Route path="/lock-screen" element={<LockScreen />} />
              <Route path="/confirm-email" element={<ConfirmEmail />} />
              <Route
                path="/email-verification"
                element={<EmailVerification />}
              />
              <Route path="/page-404" element={<Page404 />} />
              <Route path="/page-500" element={<Page500 />} />
            </Routes>
          </Suspense>
        </UserProvider>
      </HashRouter>
    </ThemeProvider>
  );
};

export default App;
