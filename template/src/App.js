import React, { Component, Suspense, useEffect } from "react";
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
import { useLocalStorage } from "./hooks/useLocalStorage";

const loading = (
    <div className="pt-3 text-center">
        <div className="sk-spinner sk-spinner-pulse"></div>
    </div>
);

const isAuthenticated = () => {
    const now = moment().valueOf()
    const storage = JSON.parse(localStorage.getItem('magnunToken')) || null

    if (!storage) return false
    if (now > storage?.expires) {
        localStorage.removeItem('magnunToken')
        return false
    }

    return true
}

const DefaultLayout = React.lazy(() => import("./layout/Default"));

const PrivateRoutes = () => isAuthenticated() ? <Outlet /> : <Navigate to='/login' />

class App extends Component {
    render() {
        return <ThemeProvider>
            <HashRouter>
                <Suspense fallback={loading}>
                    <Routes>
                        <Route element={<PrivateRoutes />}>
                            <Route
                                path="*"
                                name="Home"
                                element={<DefaultLayout />}
                            />
                        </Route>
                        
                        <Route path='/login' element={<Login />} exact />
                        <Route path='/register' element={<Register />} exact />
                        <Route path='/recover-password' element={<RecoverPassword />} exact />
                        <Route path='/lock-screen' element={<LockScreen />} exact />
                        <Route path='/confirm-email' element={<ConfirmEmail />} exact />
                        <Route path='/email-verification' element={<EmailVerification />} exact />
                        <Route path='/page-404' element={<Page404 />} exact />
                        <Route path='/page-500' element={<Page500 />} exact />
                    </Routes>
                </Suspense>
            </HashRouter>
        </ThemeProvider>
    }
}

export default App;
