import React from 'react';
import { useNavigate } from "react-router-dom";

import { useFormatValue } from '../../../../../hooks/useFormatValue';
import { useTheme } from '../../../../../hooks/useTheme';
import { translate } from '../../../../../hooks/translate';
import { useLocalStorage } from '../../../../../hooks/useLocalStorage';

import { textTransform } from '../../../../../_utils';

import Avatar from "../../../../../components/CustomUI/Avatar";
import AvatarGroup from '../../../../../components/BaseUI/AvatarGroup';
import Progress from "../../../../../components/BaseUI/Progress";
import { Table, Tr, Td } from "../../../../../components/BaseUI/Table";
import Lozenge from '../../../../../components/BaseUI/Lozenge';

import './style.scss';

export default function ProjectGrid({ data }) {
    const format = useFormatValue
    const navigate = useNavigate()
    const theme = useTheme();
    const { getStorage } = useLocalStorage()

    const status = {
        'Ongoing': 'warning',
        'Not Started': 'default',
        'Delayed': 'danger',
        'Completed': 'success'
    }

    const colors = {
        'Ongoing': '#F5CD47',
        'Not Started': '#42516D',
        'Delayed': '#CA371C',
        'Completed': '#32A877'
    }

    const headers = [
        { name: translate('PROJECTS.PROJECT'), resizable: true },
        { name: translate('PROJECTS.MEMBERS'), resizable: true },
        { name: translate('UI.STATUS') },
        { name: translate('UI.PROGRESS'), resizable: true },
        { name: translate('PROJECTS.TASKS'), resizable: true },
        { name: translate('UI.ATTACHMENTS'), resizable: true },
        { name: translate('UI.COMMENTS'), resizable: true },
        { name: translate('PROJECTS.TERM'), resizable: true },
    ];

    return <div className="project-list-container">
         <Table
            columns={headers}
            identifier="project_list"
            pagination={true}
            enableCheckbox={true}
            locale={getStorage('lang')?.split('-')?.[0] || 'en'}
        >
            {data?.map((project, index) => (
                <Tr key={index}>
                    <Td className="d-flex align-items-center gap-1">
                        <Avatar
                            src={project?.image}
                            name={project?.name}
                            size='small'
                        />

                        <div onClick={() => navigate(`/dashboard/projects/detail/${project?.id}`)}>{project?.name}</div>
                    </Td>
                    <Td>
                        <AvatarGroup data={project?.users} max={4} size='small' borderColor={theme === 'dark' ? '#BBCCEB' : ''}/>
                    </Td>
                    <Td>
                        <Lozenge appearance={status[project?.status]}>{project?.status}</Lozenge>
                    </Td>
                    <Td>
                        <Progress progress={project?.progress} showProgress color={colors[project?.status]} height='8px'/>
                    </Td>
                    <Td>
                        <Lozenge appearance={`${status[project?.status]}-subtle`}>
                            {project?.tasks} {textTransform('lowercase', translate('PROJECTS.TASKS'))}
                        </Lozenge>
                    </Td>
                    <Td>
                        <Lozenge appearance={`${status[project?.status]}-subtle`}>
                            {project?.attachments} {textTransform('lowercase', translate('UI.ATTACHMENTS'))}
                        </Lozenge>
                    </Td>
                    <Td>
                        <Lozenge appearance={`${status[project?.status]}-subtle`}>
                            {project?.comments} {textTransform('lowercase', translate('UI.COMMENTS'))}
                        </Lozenge>
                    </Td>
                    <Td>{format(project?.deadline, 'date')}</Td>
                </Tr>
            ))}
        </Table>
    </div>
}