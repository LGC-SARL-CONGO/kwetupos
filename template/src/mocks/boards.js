import { v4 as uuidv4 } from 'uuid'

const mockData = [
    {
        id: uuidv4(),
        title: 'Pending Tasks',
        items: [
            {
                id: uuidv4(),
                title: 'Master Advanced JavaScript',
                category: 'Marketing',
                priority: 'low',
                className: 'badge-success-outline',
                contributors: [
                    { value: 1, name: 'Sarah Wins', image: '' },
                ],
                completedTasks: 1,
                totalTasks: 6,
                startDate: '2022-11-12',
                endDate: '2023-01-10',
                lastUpdated: '2023-01-02',
                concluded: false,
                description: 'Contrary to popular belief, Lorem Ipsum is not simply random text',
                comments: 0,
                attachments: 0
            },
            {
                id: uuidv4(),
                title: 'Master Git Version Control',
                category: 'Coaching',
                priority: 'medium',
                className: 'badge-warning-outline',
                contributors: [
                    { value: 2, name: 'Jennyfer Whatson', image: '' },
                    { value: 5, name: 'Stefanny Bitencurt', image: '' },
                    { value: 8, name: 'Cláudio Dias', image: '' },
                    { value: 10, name: 'Carolina Ferreira', image: '' },
                ],
                completedTasks: 3,
                totalTasks: 4,
                startDate: '2022-12-16',
                endDate: '2023-01-19',
                lastUpdated: '2022-01-26',
                concluded: false,
                description: 'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.',
                comments: 3,
                attachments: 1
            },
            {
                id: uuidv4(),
                title: 'Learn Python for Web Development',
                category: 'Design System',
                priority: 'low',
                className: 'badge-danger-outline',
                contributors: [
                    { value: 9, name: 'Laura Lima', image: '' },
                ],
                completedTasks: 3,
                totalTasks: 9,
                startDate: '2023-02-12',
                endDate: '2023-03-07',
                lastUpdated: '2023-02-28',
                concluded: false,
                description: 'Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.',
                comments: 6,
                attachments: 0
            },
        ]
    },
    {
        id: uuidv4(),
        title: 'In Progress',
        items: [
            {
                id: uuidv4(),
                title: 'Deep Dive into CSS Grid',
                category: 'Desktop',
                priority: 'high',
                className: 'badge-primary-outline',
                contributors: [
                    { value: 7, name: 'Esther Duarte', image: '' },
                    { value: 6, name: 'Emilly Lins', image: '' },
                    { value: 1, name: 'Sarah Wins', image: '' },
                ],
                completedTasks: 6,
                totalTasks: 10,
                startDate: '2022-12-14',
                endDate: '2023-02-20',
                lastUpdated: '2023-01-16',
                concluded: false,
                description: 'Exploring advanced features of CSS Grid for complex and responsive layouts.',
                comments: 4,
                attachments: 2
            },
            {
                id: uuidv4(),
                title: 'Learn Golang for Web Application Development',
                category: 'Branding',
                priority: 'medium',
                className: 'badge-success-outline',
                contributors: [
                    { value: 10, name: 'Carolina Ferreira', image: '' }
                ],
                completedTasks: 9,
                totalTasks: 9,
                startDate: '2023-01-04',
                endDate: '2023-02-26',
                lastUpdated: '2023-01-19',
                concluded: true,
                description: 'Exploring the efficiency and concurrency of the Golang language for modern web development.',
                comments: 18,
                attachments: 7
            }
        ]
    },
    {
        id: uuidv4(),
        title: 'Completed',
        items: [
            {
                id: uuidv4(),
                title: 'Master HTML5 and CSS3',
                category: 'UX/UI',
                priority: 'high',
                className: 'badge-warning-outline',
                contributors: [
                    { value: 2, name: 'Jennyfer Whatson', image: '' },
                    { value: 9, name: 'Laura Lima', image: '' },
                ],
                completedTasks: 7,
                totalTasks: 7,
                startDate: '2022-11-12',
                endDate: '2023-03-04',
                lastUpdated: '2023-01-02',
                concluded: true,
                description: 'Enhancing skills in HTML5 and CSS3 for creating modern and responsive interfaces.',
                comments: 24,
                attachments: 13
            }
        ]
    }
]

export default mockData
