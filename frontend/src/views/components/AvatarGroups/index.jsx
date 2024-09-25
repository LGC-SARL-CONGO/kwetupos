import React from "react";

import AppPage from "../../../components/CustomUI/AppPage";
import { Tabs, TabContent } from "../../../components/BaseUI/Tabs";
import {ComponentInfo, Description, Preview, Snippet} from "../../../components/CustomUI/ComponentInfo";
import AvatarGroup from '../../../components/BaseUI/AvatarGroup';

import users from '../../../mocks/users.json';


export default function AvatarGroups() {
    return (
        <AppPage title="Avatar Group">
            <Tabs tabs={[{ title: "Examples" }]}>
                    <TabContent>
                        <div className="mt-3">
                            <ComponentInfo title='Default'>
                                <Description>
                                    <p>By default, the avatar group will apply a stack view and limit the list display to 4 items.</p>
                                </Description>

                                <Preview>
                                    <AvatarGroup data={users} />
                                </Preview>

                                <Snippet>
                                    {`
                                        import React from 'react';

                                        import AvatarGroup from '../../../components/BaseUI/AvatarGroup';

                                        import users from '../../../mocks/users.json';

                                        const AvatarGroupDefaultExample = () => {
                                            return <AvatarGroup data={users}/>;
                                        };

                                        export default AvatarGroupDefaultExample;
                                    `}
                                </Snippet>
                            </ComponentInfo>
                        </div>

                        <div className="mt-3">
                            <ComponentInfo title='Grid'>
                                <Description>
                                    <p>When opting for the grid view, 6 avatars will be displayed as a default limit.</p>
                                </Description>

                                <Preview>
                                    <AvatarGroup data={users} appearance='grid'/>
                                </Preview>

                                <Snippet>
                                    {`
                                        import React from 'react';

                                        import AvatarGroup from '../../../components/BaseUI/AvatarGroup';

                                        import users from '../../../mocks/users.json';

                                        const AvatarGroupGridExample = () => {
                                            return <AvatarGroup data={users} appearance='grid'/>;
                                        };

                                        export default AvatarGroupGridExample;
                                    `}
                                </Snippet>
                            </ComponentInfo>
                        </div>

                        <div className="mt-3">
                            <ComponentInfo title='Max'>
                                <Description>
                                    <p>This feature should be used when you want to limit the number of avatars displayed.</p>
                                </Description>

                                <Preview>
                                    <AvatarGroup data={users} appearance='stack' max={5}/>
                                </Preview>

                                <Snippet>
                                    {`
                                        import React from 'react';

                                        import AvatarGroup from '../../../components/BaseUI/AvatarGroup';

                                        import users from '../../../mocks/users.json';

                                        const AvatarGroupMaxExample = () => {
                                            return <AvatarGroup data={users} appearance='stack' max={5}/>;
                                        };

                                        export default AvatarGroupMaxExample;
                                    `}
                                </Snippet>
                            </ComponentInfo>
                        </div>

                        <div className="mt-3">
                            <ComponentInfo title='Border color'>
                                <Description>
                                    <p>Define customizable border colors.</p>
                                </Description>

                                <Preview>
                                    <AvatarGroup data={users} borderColor='#ca06d1'/>
                                </Preview>

                                <Snippet>
                                    {`
                                        import React from 'react';

                                        import AvatarGroup from '../../../components/BaseUI/AvatarGroup';

                                        import users from '../../../mocks/users.json';

                                        const AvatarGroupBorderColorExample = () => {
                                            return <AvatarGroup data={users} borderColor='#ca06d1'/>;
                                        };

                                        export default AvatarGroupBorderColorExample;
                                    `}
                                </Snippet>
                            </ComponentInfo>
                        </div>
                    </TabContent>
                    
                    <TabContent>
                       
                    </TabContent>
            </Tabs>
        </AppPage>
    );
}
