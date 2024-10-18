import React from "react";

import AppPage from "../../../components/CustomUI/AppPage";
import { Table, Tr, Td } from "../../../components/BaseUI/Table";
import Money from "../../../components/CustomUI/Money";
import { Tabs, TabContent } from "../../../components/BaseUI/Tabs";
import {ComponentInfo, Description, Preview, Snippet} from "../../../components/CustomUI/ComponentInfo";

export default function Tables(props) {
    const columns = [
        { name: "Name", sort: "name", sortable: true, resizable: true, filter: {type: 'text', label: 'Name', options: []} },
        { name: "Price", sort: "price", sortable: true, resizable: true, filter: {type: 'between', label: 'Price', options: []} },
        {
            name: "Quantity",
            sort: "quantity",
            sortable: true,
            resizable: false,
            filter: {type: 'between', label: 'Price', options: []} 
        },
    ];

    const data = [
        { id: 1, name: "Chocolate Vanilla Cake", price: 49.9, quantity: 12 },
        { id: 2, name: "Passion Fruit Juice", price: 9.2, quantity: 38 },
        { id: 3, name: "Apple Pie with Granola", price: 59.9, quantity: 21 },
        { id: 4, name: "Shrimp Risotto", price: 119.9, quantity: 28 },
    ];

    return (
        <AppPage title="Table and Pagination">
            <Tabs tabs={[{ title: "Preview" }]}>
                <TabContent>
                   <div className="mt-3">
                        <ComponentInfo title='Default'>
                            <Description>
                                <p>This is standard progress.</p>
                            </Description>

                            <Preview>
                                <Table
                                    title='Lista de produtos'
                                    columns={columns}
                                    identifier="table_one"
                                    pagination={true}
                                >
                                    {data.map((item, index) => (
                                        <Tr key={index} enableCheckbox={true}>
                                            <Td>{item.name}</Td>
                                            <Td>
                                                <Money value={item.price} />
                                            </Td>
                                            <Td>{item.quantity}</Td>
                                        </Tr>
                                    ))}
                                </Table>
                            </Preview>

                            <Snippet>
                                {`
                                    import React from 'react';

                                    import Progress from "../../../components/BaseUI/Progress";

                                    const ProgressDefaultExample = () => {
                                        return <Progress progress={47} />
                                    };

                                    export default ProgressDefaultExample;
                                `}
                            </Snippet>
                        </ComponentInfo>
                   </div>
                </TabContent>
            </Tabs>
        </AppPage>
    );
}
