import React from "react";

import AppPage from "../../../components/CustomUI/AppPage";
import Button from "../../../components/BaseUI/Button";
import { Tabs, TabContent } from "../../../components/BaseUI/Tabs";
import {
  ComponentInfo,
  Description,
  Preview,
  Snippet,
} from "../../../components/CustomUI/ComponentInfo";

export default function Buttons(props) {
  const breadcrumbs = [
    { label: "KwetuPOS", url: "" },
    { label: "Base UI", url: "" },
    { label: "Design System" },
  ];

  return (
    <AppPage title="Buttons" breadcrumbs={breadcrumbs}>
      <Tabs tabs={[{ title: "Examples" }]}>
        <TabContent>
          <div className="mt-3">
            <ComponentInfo title="Default">
              <Description>
                <p>This is the default button.</p>
              </Description>

              <Preview>
                <Button title="Default button" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonDefaultExample = () => {
                                        return <Button title="Default button" />
                                    };

                                    export default ButtonDefaultExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>

          <div className="mt-3">
            <ComponentInfo title="Primary">
              <Description>
                <p>This is the primary button.</p>
              </Description>

              <Preview>
                <Button title="Primary button" appearance="primary" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonPrimaryExample = () => {
                                        return <Button title="Primary button" appearance="primary" />
                                    };

                                    export default ButtonPrimaryExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>

          <div className="mt-3">
            <ComponentInfo title="Warning">
              <Description>
                <p>This is the warning button.</p>
              </Description>

              <Preview>
                <Button title="Warning button" appearance="warning" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonWarningExample = () => {
                                        return <Button title="Warning button" appearance="warning" />
                                    };

                                    export default ButtonWarningExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>

          <div className="mt-3">
            <ComponentInfo title="Danger">
              <Description>
                <p>This is the danger button.</p>
              </Description>

              <Preview>
                <Button title="Danger button" appearance="danger" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonDangerExample = () => {
                                        return <Button title="Danger button" appearance="danger" />
                                    };

                                    export default ButtonDangerExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>

          <div className="mt-3">
            <ComponentInfo title="Soft">
              <Description>
                <p>This is the soft button.</p>
              </Description>

              <Preview>
                <Button title="Soft button" appearance="soft" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonSoftExample = () => {
                                        return <Button title="Soft button" appearance="soft" />
                                    };

                                    export default ButtonSoftExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>

          <div className="mt-3">
            <ComponentInfo title="Link">
              <Description>
                <p>This is the link button.</p>
              </Description>

              <Preview>
                <Button title="Link button" appearance="link" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonLinkExample = () => {
                                        return <Button title="Link button" appearance="link" />
                                    };

                                    export default ButtonLinkExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>

          <div className="mt-3">
            <ComponentInfo title="Soft link">
              <Description>
                <p>This is the soft link button.</p>
              </Description>

              <Preview>
                <Button title="Soft link button" appearance="soft-link" />
              </Preview>

              <Snippet>
                {`
                                    import React from 'react';

                                    import Button from "../../../components/BaseUI/Button";

                                    const ButtonSoftLinkExample = () => {
                                        return <Button title="Soft link button" appearance="soft-link" />
                                    };

                                    export default ButtonSoftLinkExample;
                                `}
              </Snippet>
            </ComponentInfo>
          </div>
        </TabContent>

        <TabContent></TabContent>
      </Tabs>
    </AppPage>
  );
}
