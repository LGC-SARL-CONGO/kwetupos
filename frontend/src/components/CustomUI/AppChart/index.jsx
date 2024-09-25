import React, { useState, useEffect } from "react";
import Chart from "react-apexcharts";
import { v4 as uuid } from 'uuid'

import { useTheme } from '../../../hooks/useTheme';
import { translate } from '../../../hooks/translate';
import { Dropdown, DropdownContent, DropdownItem } from '../../BaseUI/Dropdown';

import { MdExpandMore } from "react-icons/md";

import styles from './AppChart.module.scss';

export default function AppChart(props) {
    const theme = useTheme()

    const [state, setState] = useState({
        type: props.type,
        width: props.width,
        height: props.height,
        orientation: props.orientation,
        hideYaxisLabel: props.hideYaxisLabel,
        fontSize: props.fontSize,
        title: props.title,
        filter: props.filter,
        defaultFilter: props.defaultFilter || translate('UI.TODAY'),
        className: props.className,
        direction: props.direction,
        alignment: props.alignment,
        verticalMargin: props?.verticalMargin,
        options: {
            chart: {
                toolbar: {
                    show: false
                },
                offsetX: props.offsetX || 0,
                offsetY: props.offsetY || 0,
                parentHeightOffset: 0,
                sparkline: {
                    enabled: props.sparkline ? true : false
                },
            },
            grid: {
                xaxis: {
                    lines: {
                        show: false
                    }
                },   
                yaxis: {
                    lines: {
                        show: false
                    },
                    labels: {
                        show: false,
                    }
                }, 
                padding: {
                    top: props?.padding?.top || 0,
                    right: props?.padding?.right || 0,
                    bottom: props?.padding?.bottom || 0,
                    left: props?.padding?.left || 0
                }, 
            },
            responsive: [{
                breakpoint: 480,
                options: {
                  legend: {
                    position: 'bottom',
                    offsetX: -10,
                    offsetY: 0
                  }
                }
            }],
            legend: {
                show: props.legend || false,
                position: props.direction || 'bottom',
                horizontalAlign: props.alignment || 'center',
                markers: {
                    width: props.roundedMarkers ? 10 : 14,
                    height: props.roundedMarkers ? 10 : 14,
                    radius: props.roundedMarkers ? 14 : 0,
                    offsetX: -2,
                    offsetY: (!props.roundedMarkers && (props.alignment === 'left' || props.alignment === 'right' || props.direction === 'left' || props.direction === 'right')) ? 2.5 : props.roundedMarkers ? 1 : -1
                },
            },
            colors: props.colors || ["#403bfc"],
            ...(props?.labels && {labels: props.labels}),
            tooltip: {
                theme: theme,
            },
            ...props?.options
        },
        series: [...props?.series],
    })

    const typesOfGraphics = {
        'area': 'area',
        'splineArea': 'area',
        'bar': 'bar',
        'barStacked': 'bar',
        'basicBar': 'bar',
        'multiBar': 'bar',
        'line': 'line',
        'pie': 'pie',
        'donut': 'donut',
        'scatter': 'scatter',
        'bubble': 'bubble',
        'heatmap': 'heatmap',
        'radialBar': 'radialBar',
        'basicRadial': 'radialBar',
        'strokedGauge': 'radialBar',
        'semiCircleGauge': 'radialBar',
    }


    useEffect(() => {
        getOptions()
    }, [theme])

    const getOptions = () => {
        switch (state.type) {
            case 'area':
                setState({...state, options: {...state.options, ...setOptionsAreaChart()}})
                break;
            case 'splineArea':
                setState({...state, options: {...state.options, ...setSplineAreaChartOptions(state)}})
                break;
            case 'bar':
                setState({...state, options: {...state.options, ...setBarChartOptions(state)}})
                break;
            case 'barStacked':
                setState({...state, options: {...state.options, ...setStackedBarChartOptions()}})
                break;
            case 'basicBar':
                setState({...state, options: {...state.options, ...setBasicBarChartOptions()}})
                break;
            case 'multiBar':
                setState({...state, options: {...state.options, ...setMultiBarChartOptions()}})
                break;
            case 'pie':
                setState({...state, options: {...state.options, ...setPieChartOptions()}})
                break;
            case 'donut':
                setState({...state, options: {...state.options, ...setDonutChartOptions()}})
                break;
            case 'strokedGauge':
                setState({...state, options: {...state.options, ...setStrokedGaugeChartOptions()}})
                break;
            case 'basicRadial':
                setState({...state, options: {...state.options, ...setBasicRadialChartOptions(state)}})
                break;
            case 'radialBar':
                setState({...state, options: {...state.options, ...setRadialChartOptions(state)}})
                break;
            case 'semiCircleGauge':
                setState({...state, options: {...state.options, ...setSemiCircleGaugeChartOptions(state)}})
                break;
        
            default:
                break;
        }
    }

    const setOptionsAreaChart = () => {
        return {
            dataLabel: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 3,
            },
            fill: {
                gradient: {
                    enabled: true,
                    opacityFrom: 0.95,
                    opacityTo: 0
                }
            },
            dataLabels: {
                enabled: false,
            },
            yaxis: {
                axisBorder: {
                    show: false
                },

                axisTicks: {
                    show: false,
                },

                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            xaxis: {
                axisBorder: {
                    show: false
                },
                axisTicks: {
                    show: false,
                },
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setSplineAreaChartOptions = (state) => {
        return {
            dataLabel: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 4,
            },
            fill: {
                gradient: {
                    enabled: false,
                    opacityFrom: 0,
                    opacityTo: 0
                }
            },
            dataLabels: {
                enabled: false,
            },
            legend: {
                show: true,
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            },
            yaxis: {
                axisBorder: {
                    show: false
                },

                axisTicks: {
                    show: false,
                },
                labels: {
                    show: !state.hideYaxisLabel ? true : false,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            xaxis: {
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
        }
    }

    const setStackedBarChartOptions = () => {
        return {
            chart: {
                stacked: true,
                stackType: '100%'
            },
            dataLabel: {
                enabled: false
            },
            stroke: {
                curve: 'smooth',
                width: 3,
                colors: ['transparent']
            },
            dataLabels: {
                enabled: false,
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '40%',
                }
            },
            yaxis: {
                axisBorder: {
                    show: false
                },
                axisTicks: {
                    show: false,
                },
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                },
                forceNiceScale: true
            },
            xaxis: {
                labels: {
                    show: true,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setBasicBarChartOptions = () => {
        return {
            plotOptions: {
                bar: {
                    horizontal: props?.orientation === 'horizontal',
                    columnWidth: '55%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            dataLabel: {
                enabled: false
            },
            yaxis: {
                axisBorder: {
                  show: false
                },

                axisTicks: {
                  show: false,
                },

                labels: {
                    show: true,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            xaxis: {
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setMultiBarChartOptions = () => {
        return {
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '55%',
                    endingShape: 'rounded'
                },
            },
            dataLabels: {
                enabled: false
            },
            stroke: {
                show: true,
                width: 2,
                colors: ['transparent']
            },
            dataLabel: {
                enabled: false
            },
            yaxis: {
                axisBorder: {
                  show: false
                },

                axisTicks: {
                  show: false,
                },

                labels: {
                    show: true,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            xaxis: {
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setBarChartOptions = (state) => {
        return {
            chart: {
            },
            dataLabel: {
                enabled: false
            },
            
            dataLabels: {
                enabled: false,
            },
            colors: ['#7860fd'],
            plotOptions: {
                bar: {
                    columnWidth: '30%',
                    horizontal:  state?.orientation === 'horizontal' ? true : false
                }
            },
            yaxis: {
                axisBorder: {
                    show: false
                },

                axisTicks: {
                    show: false,
                },

                labels: {
                    show: false,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                },
            },
            xaxis: {
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setPieChartOptions = () => {
        return {
            chart: {
            },
            dataLabel: {
                enabled: false
            },
            
            dataLabels: {
                enabled: false,
            },
            colors: ['#7860fd', '#85d9fe', '#e6edf8'],
            plotOptions: {},
            yaxis: {
                axisBorder: {
                    show: false
                },

                axisTicks: {
                    show: false,
                },

                labels: {
                    show: false,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            xaxis: {
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setDonutChartOptions = () => {
        return {
            chart: {
            },
            dataLabel: {
                enabled: false
            },
            
            dataLabels: {
                enabled: false,
            },
            plotOptions: {},
            yaxis: {
                axisBorder: {
                    show: false
                },

                axisTicks: {
                    show: false,
                },

                labels: {
                    show: false,
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                },
            },
            xaxis: {
                labels: {
                    style: {
                        fontSize: '14px',
                        colors: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                    },
                },
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
                // formatter: function(seriesName, opts) {
                //     const value = opts.w.globals.series[opts.seriesIndex]
                //     const sum = opts.w.globals.series.reduce((a, b) => a + b, 0);
                //     const percent = (value / sum) * 100;

                //     return [seriesName, "-", `${percent.toFixed(0)}%`]
                // },
                ...((state?.direction === 'right' && state?.alignment === 'center') && {offsetY: 30, offsetX: -20}),
                ...(props?.verticalMargin && {
                    itemMargin: {
                        vertical: props?.verticalMargin
                    },
                })
            }
        }
    }

    const setStrokedGaugeChartOptions = () => {
        return {
            chart: {
                offsetY: -10
            },
            plotOptions: {
                radialBar: {
                  startAngle: -135,
                  endAngle: 135,
                  dataLabels: {
                    name: {
                      fontSize: '14px',
                      color: '#42516D',
                      offsetY: 70,
                      show: false,
                    },
                    value: {
                      offsetY: 5,
                      fontSize: '22px',
                      color: '#42516D',
                      formatter: function (val) {
                        return val + "%";
                      }
                    }
                  }
                }
            },
            fill: {
                type: 'gradient',
                gradient: {
                    shade: 'dark',
                    shadeIntensity: 0.15,
                    inverseColors: false,
                    opacityFrom: 1,
                    opacityTo: 1,
                    stops: [0, 50, 65, 91]
                },
            },
            stroke: {
                dashArray: 4
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setBasicRadialChartOptions = (state) => {
        return {
            chart: {
                type: 'radialBar',
                offsetY: -10
            },
            plotOptions: {
                radialBar: {
                  startAngle: -180,
                  endAngle: 180,
                  dataLabels: {
                    name: {
                      fontSize: '14px',
                      color: '#42516D',
                      offsetY: 70,
                      show: false,
                    },
                    value: {
                      offsetY: 5,
                      fontSize: state.fontSize || '22px',
                      color: state.textColor || '#403bfc',
                      formatter: function (val) {
                        return val + "%";
                      }
                    }
                  }
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setRadialChartOptions = (state) =>  {
        return {
            chart: {
                type: 'radialBar',
                offsetY: -10
            },
            plotOptions: {
                radialBar: {
                  dataLabels: {
                    name: {
                      fontSize: '22px',
                    },
                    value: {
                      fontSize: '16px',
                    },
                    total: {
                      show: true,
                      label: 'Total',
                      formatter: function (options) {
                        return options.config?.series.reduce((acumulador, valorAtual) => {
                            return acumulador + valorAtual;
                          }, 0)
                      }
                    }
                  }
                }
            },
            tooltip: {
                theme: theme,
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }

    const setSemiCircleGaugeChartOptions = (state) =>  {
        return {
            chart: {
                type: 'radialBar',
                sparkline: {
                  enabled: true
                }
            },
            plotOptions: {
                radialBar: {
                    startAngle: -90,
                    endAngle: 90,
                    track: {
                        background: "#eeecff",
                        strokeWidth: '97%',
                        margin: 5,
                    },
                    dataLabels: {
                        name: {
                            show: false
                        },
                        value: {
                            offsetY: -2,
                            fontSize: '20px',
                            fontWeight: '600',
                            color: theme === 'dark' ?  '#a6b0cf' :  '#42516D'
                        }
                    }
                }
            },
            grid: {
                padding: {
                    top: -10
                }
            },
            legend: {
                labels: {
                    colors: theme === 'dark' ?  '#a6b0cf' :  '#475467',
                },
            }
        }
    }


    return (
        <div className={`${styles['app-chart-container']} ${state.className}`} data-theme={theme}>
            {state?.title && <div className={styles['app-chart-container__header']}>
                <span className={styles['title']}>{state?.title}</span>

                {state?.filter?.length && <Dropdown 
                    trigger={<div className={styles['filter__dropdown']}>
                        <span>{state.defaultFilter}</span>
                        <MdExpandMore />
                    </div>}
                    placement='top-end'
                    hideDropdownIcon={true}
                >
                    <DropdownContent>
                        {state.filter.map((option, index) => (
                            <DropdownItem 
                                key={index} 
                                onClick={() => setState({...state, defaultFilter: option.name})}
                            >{option.name}</DropdownItem>
                        ))}
                    </DropdownContent>
                </Dropdown>}
            </div>}

            <Chart
                options={state.options}
                series={state.series}
                type={typesOfGraphics[state?.type]}
                width={state.width}
                height={state.height}
            />
        </div>
    );
}