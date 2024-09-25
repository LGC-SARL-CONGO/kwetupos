import React from 'react';
import {useFormatValue} from '../../../hooks/useFormatValue';

import AppChart from '../AppChart';
import GrowthRate from '../GrowthRate';

import styles from './CardInfoAnalytic.module.scss';

export default function CardInfoAnalytic({ values }) {
    const formatValue = useFormatValue

    return <div className={styles['card-info-container']}>
        <div className={styles['card-info-container__analytic']}>
            <div className={styles['card-info-container__analytic__header']}>
                <div className={styles['card-info-container__analytic__header--title']} title={values.title}>{values.title}</div>
                <div>
                    <GrowthRate currentValue={values.currentValue} previousValue={values.previousValue}/>
                </div>
            </div>

            <div className={styles['card-info-container__analytic__chart']}>
                <div className={styles['card-info-container__analytic__chart--value']}>{formatValue(values?.currentValue, values?.type)}</div>     
                
                <AppChart 
                    type={values?.chart || 'basicBar'} 
                    options={values.values} 
                    series={values.series} 
                    legend={false} 
                    hideYaxisLabel={true}
                    height={90}
                    colors={values.colors}
                    sparkline={true}
                    offsetY={40}
                    className={styles['card-info-container__analytic__chart--reset-style']}
                />
            </div>
        </div>
    </div>
}