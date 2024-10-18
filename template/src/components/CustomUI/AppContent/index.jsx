import React, { Suspense } from 'react'
import { Navigate, Route, Routes } from 'react-router-dom'

import './style.scss';

import routes from '../../../routes'

const AppContent = () => {
  return (
    <div className='app-content-container'>
        <Suspense fallback={[]}>
            <Routes>
                {routes.map((route, index) => {
                return (
                    route.element && (
                        <Route
                            key={index}
                            path={route.path}
                            exact={route.exact}
                            name={route.name}
                            element={<route.element />}
                        />
                    )
                )
                })}
                
                <Route path="/" element={<Navigate to="dashboard" replace />} />
            </Routes>
        </Suspense>
    </div>
  )
}

export default React.memo(AppContent)