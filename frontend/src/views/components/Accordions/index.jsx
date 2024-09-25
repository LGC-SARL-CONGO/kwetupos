import React from "react";

import AppPage from "../../../components/CustomUI/AppPage";
import Accordion from "../../../components/BaseUI/Accordion";
import AccordionItem from "../../../components/BaseUI/AccordionItem";
import { Tabs, TabContent } from "../../../components/BaseUI/Tabs";
import {ComponentInfo, Description, Preview, Snippet} from "../../../components/CustomUI/ComponentInfo";


export default function Accordions(props) {
    const items = [
        { title: "First accordion" },
        { title: "Second accordion" },
        { title: "Third accordion" },
    ]
    
    return (
        <AppPage title="Accordions">
            <Tabs tabs={[{ title: "Preview" }]}>
                <TabContent>
                   <div className="mt-3">
                        <ComponentInfo title='Default'>
                            <Description>
                                <p>By default, all items will initialize collapsed, and when one is expanded, the previously opened one will collapse.</p>
                            </Description>

                            <Preview>
                                <Accordion items={items}>
                                    <AccordionItem>
                                        It is a long established fact that a reader will be
                                        distracted by the readable content of a page when.
                                    </AccordionItem>
                                    <AccordionItem>
                                        There are many variations of passages of Lorem Ipsum
                                        available.
                                    </AccordionItem>
                                    <AccordionItem>
                                        Contrary to popular belief, Lorem Ipsum is not
                                        simply random text.
                                    </AccordionItem>
                                </Accordion>
                            </Preview>

                            <Snippet>
                                {`
                                    import React from 'react';

                                    import Accordion from "../../../components/BaseUI/Accordion";
                                    import AccordionItem from "../../../components/BaseUI/AccordionItem";

                                    const AccordionDefaultExample = () => {
                                        const items = [
                                            { title: "First accordion" },
                                            { title: "Second accordion" },
                                            { title: "Third accordion" },
                                        ]

                                        return <Accordion items={items}>
                                            <AccordionItem>
                                                It is a long established fact that a reader will be
                                                distracted by the readable content of a page when.
                                            </AccordionItem>
                                            <AccordionItem>
                                                There are many variations of passages of Lorem Ipsum
                                                available.
                                            </AccordionItem>
                                            <AccordionItem>
                                                Contrary to popular belief, Lorem Ipsum is not
                                                simply random text.
                                            </AccordionItem>
                                        </Accordion>
                                    };

                                    export default AccordionDefaultExample;
                                `}
                            </Snippet>
                        </ComponentInfo>

                        <ComponentInfo title='Use gap'>
                            <Description>
                                <p>Using gap creates vertical spacing between accordion elements.</p>
                            </Description>

                            <Preview>
                                <Accordion items={items} gap='8px'>
                                    <AccordionItem>
                                        It is a long established fact that a reader will be
                                        distracted by the readable content of a page when.
                                    </AccordionItem>
                                    <AccordionItem>
                                        There are many variations of passages of Lorem Ipsum
                                        available.
                                    </AccordionItem>
                                    <AccordionItem>
                                        Contrary to popular belief, Lorem Ipsum is not
                                        simply random text.
                                    </AccordionItem>
                                </Accordion>
                            </Preview>

                            <Snippet>
                                {`
                                    import React from 'react';

                                    import Accordion from "../../../components/BaseUI/Accordion";
                                    import AccordionItem from "../../../components/BaseUI/AccordionItem";

                                    const AccordionUseGapExample = () => {
                                        const items = [
                                            { title: "First accordion" },
                                            { title: "Second accordion" },
                                            { title: "Third accordion" },
                                        ]
                                        
                                        return <Accordion items={items} gap='8px'>
                                            <AccordionItem>
                                                It is a long established fact that a reader will be
                                                distracted by the readable content of a page when.
                                            </AccordionItem>
                                            <AccordionItem>
                                                There are many variations of passages of Lorem Ipsum
                                                available.
                                            </AccordionItem>
                                            <AccordionItem>
                                                Contrary to popular belief, Lorem Ipsum is not
                                                simply random text.
                                            </AccordionItem>
                                        </Accordion>
                                    };

                                    export default AccordionUseGapExample;
                                `}
                            </Snippet>
                        </ComponentInfo>
                   </div>
                </TabContent>
            </Tabs>
        </AppPage>
    );
}
