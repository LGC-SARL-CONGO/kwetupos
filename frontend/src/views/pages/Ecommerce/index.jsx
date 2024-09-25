import React, { useState } from 'react';

import { useFormatValue } from '../../../hooks/useFormatValue';
import { translate } from '../../../hooks/translate';
import { useLocalStorage } from '../../../hooks/useLocalStorage';

import CardInfo from '../../../components/CustomUI/CardInfo';
import AppPage from '../../../components/CustomUI/AppPage';
import CardContainer from '../../../components/CustomUI/CardContainer';
import AppChart from '../../../components/CustomUI/AppChart';
import Container from '../../../components/CustomUI/Container';
import ContainerItem from '../../../components/CustomUI/Container/ContainerItem'
import ListGroup from '../../../components/BaseUI/ListGroup';
import ListItem from '../../../components/BaseUI/ListGroup/ListItem';
import Maps from '../../../components/CustomUI/Maps';
import Picture from '../../../components/CustomUI/Picture';
import Lozenge from '../../../components/BaseUI/Lozenge';
import { ToastContainer, Toast } from '../../../components/CustomUI/Toast';
import { Table, Tr, Td } from "../../../components/BaseUI/Table";

import { MdOutlineLocalMall } from "react-icons/md";
import { MdOutlineAccountBalanceWallet } from "react-icons/md";
import { MdOutlineInventory2 } from "react-icons/md";
import { MdCached } from "react-icons/md";

import productsJSON from '../../../mocks/products.json'

import styles from './Ecommerce.module.scss';

const Ecommerce = () => {
    const format = useFormatValue
    const { getStorage } = useLocalStorage()

    const [products, setProducts] = useState(productsJSON)
    const [toasts, setToasts] = useState([]);

    const lifetimeSales = {
        options: {
            xaxis: {
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                tooltip: {
                    enabled: false,
                },
                
            }
        },
        series: [
            {
                name: translate('UI.SALES'),
                data: [44, 55, 41, 67, 22, 43, 21, 49, 16, 23, 39, 20]
            }, 
            {
                name: translate('UI.INCOME'),
                data: [13, 23, 20, 8, 13, 27, 33, 12, 16, 23, 39, 20]
            }, 
            {
                name: translate('UI.REVENUE'),
                data: [11, 17, 15, 15, 21, 14, 15, 13, 16, 23, 39, 20]
            }
        ],
    }

    const strokedGauge = {
        series: [81],
        options: {}
    }

    const headers = [
        {name: translate('UI.NAME'), resizable: true, sort: true, filter: {type: 'text', label: translate('UI.NAME'), options: []}},
        {
            name: translate('UI.CATEGORY'), 
            resizable: true, 
            sort: true, 
            filter: {type: 'option', label: translate('UI.CATEGORY'), options: [{value: translate('UI.FOOTWEAR'), name: translate('UI.FOOTWEAR')}, {value: translate('UI.FURNITURE'), name: translate('UI.FURNITURE')}]}
        },
        {name: translate('UI.PRICE'), resizable: true, sort: true , filter: {type: 'between', label: translate('UI.PRICE'), options: []}},
        {name: translate('UI.STOCK'), resizable: true, sort: true , filter: {type: 'between', label: translate('UI.STOCK'), options: []}},
        {name: translate('UI.SALES'), resizable: true, sort: true , filter: {type: 'between', label: translate('UI.SALES'), options: []}},
        {
            name: translate('UI.STATUS'), 
            resizable: true, 
            sort: true, 
            filter: {type: 'option', label: translate('UI.STATUS'), options: [{value: translate('UI.ACTIVE'), name: translate('UI.ACTIVE')}, {value: translate('UI.INACTIVE'), name: translate('UI.INACTIVE')}]}},
        {name: translate('UI.CREATED'), resizable: true, sort: true , filter: {type: 'date', label: translate('UI.CREATED'), options: []}},
    ]
 
    const cardInfo = [
        {title: translate('DASHBOARD.TODAYS_SALES'), type: 'money', value: 3229228.7, percentage: 4.85, icon: <MdOutlineLocalMall />, money: true, appearance: 'success'},
        {title: translate('DASHBOARD.TODAYS_RECIPE'), type: 'money', value: 1722532.09, percentage: -1.64, icon: <MdOutlineAccountBalanceWallet />, money: true, appearance: 'danger'},
        {title: translate('DASHBOARD.TODAYS_ORDERS'), type: 'number', value: 3427, percentage: 2.02, icon: <MdOutlineInventory2 />, money: true, appearance: 'warning'},
        {title: translate('DASHBOARD.CONVERSION'), type: 'percentage', value: 28, percentage: 4.85, icon: <MdCached />, money: true},
    ]

    const filterOPtions = [
        {value: 'h', name: translate('UI.TODAY')},
        {value: 'w', name: translate('UI.WEEK')},
        {value: 'm', name: translate('UI.MONTH')},
        {value: 'a', name: translate('UI.YEAR')},
    ]

    const donutChat = {
        series: [28283.81, 93723.14, 16059.78],
        labels: [
            translate('DASHBOARD.DIRECT'),
            translate("DASHBOARD.SOCIAL"),
            translate("DASHBOARD.ORGANIC_RESEARCH")
        ],
        options: {},
    };

    const mapsData = {
        series: {
            regions: [{
                values: { 
                    "BR": 100,
                    "US": 200,
                    "CA": 219,
                }
            }]
        },
        seriesByRegion: {
            brazil: {
                regions: [{
                    values: { 
                        "ce": 100,
                        "sp": 200,
                        "ba": 219,
                    },
                }]
            },
            unitedStates: {
                regions: [{
                    values: { 
                        "US-CA": 100,
                        "US-WA": 280,
                    }
                }]
            },
            canada: {
                regions: [{
                    values: { 
                        "CA-ON": 100,
                    }
                }]
            }
        }
    }

    const multipleDeletion = values => {
        const updatedProducts = products.filter((product) => !values.includes(product.id));

        setProducts([...updatedProducts]);
    
        setToasts([{
            description: 'Os itens foram excluídos com sucesso do sistema',
            id: toasts?.length + 1,
            key: toasts?.length + 1,
            title: 'Exclusão bem sucedida!',
            appearance: 'success'
        }, ...toasts]);
    }

    const removeToastAutoDismiss = ()  => {
        toasts?.shift()

        setToasts([...toasts])
    }
    
    return <AppPage title="Dashboard" breadcrumbs={{}} className={styles['ecommerce-container']}>
        <Container className='mb-3'>
            {cardInfo?.map((card, index) => (
                <ContainerItem key={index} sm={4} md={4} xl={3}>
                    <CardInfo type="eccomerce" card={card} appearance={card.appearance}/> 
                </ContainerItem>
            ))}
        </Container>

        <Container>
            <ContainerItem sm={4} md={5} xl={8}>
                <AppChart
                    title={translate('DASHBOARD.LIFETIME_SALES')}
                    type='basicBar' 
                    options={lifetimeSales.options} 
                    series={lifetimeSales.series} 
                    colors={['#F5CD47', '#005FED', '#32A877']}
                    legend={true}
                    direction='top'
                    alignment='left'
                    roundedMarkers={true}
                    filter={filterOPtions}
                    height={300}
                />
            </ContainerItem>

            <ContainerItem sm={4} md={3} xl={4}>
                <Maps 
                    title={translate('DASHBOARD.SALES_BY_COUNTRY')}
                    map='brazil'
                    showLabels={true}
                    filter={[
                        {label: 'Brasil', value: 'brazil'},
                        {label: 'Estados Unidos', value: 'unitedStates'},
                        {label: 'Canadá', value: 'canada'},
                    ]}
                    data={mapsData}
                    content='vendas'
                />
            </ContainerItem>
        </Container>

        <Container>
            <ContainerItem sm={4} md={4} xl={4} className={styles['stroked__gauge']}>
                <AppChart
                    title={translate('DASHBOARD.RECENT_ORDERS')}
                    type='strokedGauge'
                    options={strokedGauge.options}
                    series={strokedGauge.series}
                    colors={['#0646A5']}
                    filter={filterOPtions}
                    className={styles['reset__shadow']}
                    height={160}
                />

                <div className={`${styles['stroked__gauge__legend']}`}>
                    <div className='d-flex flex-column'>
                        <div className='d-flex align-items-center'>
                            <div className={styles['legend__marker']}></div>
                            <span>{translate('UI.DELIVERED')}</span>
                        </div>
                        <span className={styles['legend__quantity']}>{format(3891, 'number')}</span>
                    </div>

                    <div className='d-flex flex-column'>
                        <div className='d-flex align-items-center'>
                            <div className={`${styles['legend__marker']} ${styles['legend__marker--canceled']}`}></div>
                            <span>{translate('UI.CANCELED')}</span>
                        </div>
                        <span className={styles['legend__quantity']}>{format(564, 'number')}</span>
                    </div>
                </div>
            </ContainerItem>

            <ContainerItem sm={4} md={4} xl={4} className='mt-3'>
                <AppChart
                    title={translate("DASHBOARD.RECIPES_BY_CHANNELS")}
                    type={"donut"}
                    options={donutChat.options}
                    series={donutChat.series}
                    labels={donutChat.labels}
                    legend={true}
                    height={255}
                    colors={["#C0C6CF", "#005FED", "#F5CD47"]}
                    alignment="bottom"
                    filter={filterOPtions}
                />
            </ContainerItem>

            <ContainerItem sm={4} md={8} xl={4} className='mt-3'>
                <CardContainer title={translate('DASHBOARD.RECENT_ORDERS')}>
                    <ListGroup borderless={true} >
                        {productsJSON?.slice(0, 4)?.map((product, index) => (
                            <ListItem key={index} className='px-3'>
                               <div className='d-flex align-items-center gap-1 u-ellipsis'>
                                    <Picture image={product?.image} name={product?.name}/>
                                    <div 
                                       className='u-ellipsis'
                                        title={product?.name}
                                    >
                                        {product.name}
                                    </div>
                               </div>

                                <div>{format(product?.price, 'money')}</div>
                            </ListItem>
                        ))}
                    </ListGroup>
                </CardContainer>
            </ContainerItem>
        </Container>

        <Container>
            <ContainerItem sm={4} md={8} xl={12} className='mt-3'>
                <Table
                    title={translate("ECOMMERCE.PRODUCT_LIST")}
                    columns={headers}
                    identifier="product_list"
                    enableCheckbox={true}
                    onDelete={(values) => multipleDeletion(values)}
                    locale={getStorage('lang')?.split('-')?.[0] || 'en'}
                    pagination={true}
                >
                    {products.map((product, index) => (
                        <Tr key={index} id={product?.id}>
                            <Td>
                                <div className='d-flex align-items-center gap-1'>
                                    <Picture image={product.image} minWidth='25px'/>
                                    <span>{product.name}</span>
                                </div>
                            </Td>
                            <Td>
                                <Lozenge appearance='info-subtle'>
                                    {product.category === 'Calçados' ? translate('UI.FOOTWEAR') : translate('UI.FURNITURE')}
                                </Lozenge>
                            </Td>
                            <Td>
                                {format(product?.price, 'money')}
                            </Td>
                            <Td>
                                <Lozenge appearance='info-subtle'>
                                    {format(product.stock, 'number')}
                                </Lozenge>
                            </Td>
                            <Td>
                                <Lozenge appearance='info-subtle'>
                                    {format(product.salesQuantity, 'number')}
                                </Lozenge>
                            </Td>
                            <Td>
                                <Lozenge appearance={product.status ? 'success-subtle' : 'danger-subtle'}>
                                    {product.status === 1 ? translate('UI.ACTIVE') : translate('UI.INACTIVE')}
                                </Lozenge>
                            </Td>
                            <Td>
                                {format(product?.createdDate, 'date')}
                            </Td>
                        </Tr>
                    ))}
                </Table>
            </ContainerItem>
        </Container>

        <ToastContainer autoDismiss onDismissed={removeToastAutoDismiss}>
            {toasts?.map(toast => <Toast 
                {...toast}
            />)}
        </ToastContainer>
    </AppPage>
}

export default Ecommerce;
