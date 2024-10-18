import { translate } from "./hooks/translate";
import { MdOutlineColorLens } from "react-icons/md";
import { MdOutlineCalendarToday } from "react-icons/md";
import { MdOutlineForum } from "react-icons/md";
import { MdOutlineStorefront } from "react-icons/md";
import { MdOutlineCases } from "react-icons/md";
import { MdOutlineViewKanban } from "react-icons/md";
import { MdOutlineMailOutline } from "react-icons/md";
import { MdFolderOpen } from "react-icons/md";
import { MdOutlineAccountCircle } from "react-icons/md";
import { MdOutlineInsertDriveFile } from "react-icons/md";
import { MdOutlineWidgets } from "react-icons/md";
import { FiHome } from "react-icons/fi";
import { MdOutlineLayers } from "react-icons/md";

const _nav = [
    {
        category: "Navigation",
        items: [
            {
                name: "Dashboards",
                icon: <MdOutlineLayers />,
                label: "dashboard",
                items: [
                    {
                        name: "Analytics",
                        url: "/dashboard/analytics",
                    },
                    {
                        name: "Ecommerce",
                        url: "/dashboard",
                    },
                    {
                        name: translate("MENU.PROJECTS"),
                        url: "/dashboard/projects",
                    },
                ],
            },
        ],
    },
    {
        category: "Apps",
        items: [
            {
                name: translate("MENU.CALENDAR"),
                url: "/dashboard/calendar",
                icon: <MdOutlineCalendarToday />,
            },
            {
                name: translate("MENU.CHAT"),
                url: "/dashboard/chat",
                icon: <MdOutlineForum />,
            },
            {
                name: "Ecommerce",
                icon: <MdOutlineStorefront />,
                label: "ecommerce",
                items: [
                    {
                        name: translate("MENU.PRODUCTS"),
                        url: "/dashboard/ecommerce/products",
                    },
                    {
                        name: translate("MENU.PRODUCT_DETAILS"),
                        url: "/dashboard/ecommerce/product-details",
                    },
                    {
                        name: translate("MENU.ORDERS"),
                        url: "/dashboard/ecommerce/orders",
                    },
                    {
                        name: translate("MENU.CUSTOMERS"),
                        url: "/dashboard/ecommerce/customers",
                    },
                    {
                        name: translate("MENU.SELLERS"),
                        url: "/dashboard/ecommerce/sellers",
                    },
                ],
            },
            {
                name: translate("MENU.PROJECTS"),
                icon: <MdOutlineCases />,
                label: "projects",
                items: [
                    {
                        name: translate("List"),
                        url: "/dashboard/projects/all",
                    },
                    {
                        name: translate("PROJECTS.PROJECT_OVERVIEW"),
                        url: "/dashboard/projects/detail/:id",
                    },
                    {
                        name: translate("Creat Project"),
                        url: "/dashboard/projects/create",
                    },
                ],
            },
            {
                name: translate("Kanban"),
                url: "/dashboard/kanban",
                icon: <MdOutlineViewKanban />,
            },
            {
                name: "Email",
                url: "/dashboard/email",
                icon: <MdOutlineMailOutline />,
            },
            {
                name: translate("MENU.FILE_MANAGER"),
                url: "/dashboard/file/manager",
                icon: <MdFolderOpen />,
            },
        ],
    },
    {
        category: "Pages",
        items: [
            {
                name: translate("MENU.AUTHENTICATION"),
                icon: <MdOutlineAccountCircle />,
                label: "auth",
                items: [
                    {
                        name: translate("MENU.LOGIN"),
                        url: "/login",
                        target: "_blank",
                    },
                    {
                        name: translate("MENU.REGISTER"),
                        url: "/register",
                        target: "_blank",
                    },
                    {
                        name: translate("MENU.RECOVER_PASSWORD"),
                        url: "/recover-password",
                        target: "_blank",
                    },
                    {
                        name: translate("MENU.LOCK_SCREEN"),
                        url: "/lock-screen",
                        target: "_blank",
                    },
                    {
                        name: translate("MENU.CONFIRM_EMAIL"),
                        url: "/confirm-email",
                        target: "_blank",
                    },
                    {
                        name: translate("MENU.EMAIL_VERIFICATION"),
                        url: "/email-verification",
                        target: "_blank",
                    },
                ],
            },
            {
                name: translate("MENU.UTILITY"),
                icon: <MdOutlineInsertDriveFile />,
                label: "utility",
                items: [
                    {
                        name: "Starter Page",
                        url: "/dashboard/starter-page",
                    },
                    {
                        name: "Error 404",
                        url: "/page-404",
                        target: "_blank",
                    },
                    {
                        name: "Error 500",
                        url: "/page-500",
                        target: "_blank",
                    },
                ],
            },
        ],
    },
    {
        category: "Components",
        items: [
            {
                name: "Base UI",
                icon: <MdOutlineWidgets />,
                label: "ui",
                items: [
                    {
                        "name": "Accordion",
                        "url": "/dashboard/design-system/accordions"
                    },
                    {
                        "name": "Avatar",
                        "url": "/dashboard/design-system/avatar"
                    },
                    {
                        "name": "Avatar Group",
                        "url": "/dashboard/design-system/avatar-group"
                    },
                    {
                        "name": "Badges",
                        "url": "/dashboard/design-system/badges"
                    },
                    {
                        "name": "Banners",
                        "url": "/dashboard/design-system/banners"
                    },
                    {
                        "name": "Breadcrumbs",
                        "url": "/dashboard/design-system/breadcrumbs"
                    },
                    {
                        "name": "Button group",
                        "url": "/dashboard/design-system/button-group"
                    },
                    {
                        "name": "Buttons",
                        "url": "/dashboard/design-system/buttons"
                    },
                    {
                        "name": "Checkbox",
                        "url": "/dashboard/design-system/checkbox"
                    },
                    {
                        "name": "Dropdowns",
                        "url": "/dashboard/design-system/dropdowns"
                    },
                    {
                        "name": "Inline edit",
                        "url": "/dashboard/design-system/inline-edit"
                    },
                    {
                        "name": "List group",
                        "url": "/dashboard/design-system/list-group"
                    },
                    {
                        "name": "Modals",
                        "url": "/dashboard/design-system/modals"
                    },
                    {
                        "name": "Progress",
                        "url": "/dashboard/design-system/progress"
                    },
                    {
                        "name": "Radio",
                        "url": "/dashboard/design-system/radio"
                    },
                    {
                        "name": "Range",
                        "url": "/dashboard/design-system/range"
                    },
                    {
                        "name": "Tabs",
                        "url": "/dashboard/design-system/tabs"
                    },
                    {
                        "name": "Table and Pagination",
                        "url": "/dashboard/design-system/table-and-pagination"
                    },
                    {
                        "name": "Toasts",
                        "url": "/dashboard/design-system/toasts"
                    },
                    {
                        "name": "Tooltips",
                        "url": "/dashboard/design-system/tooltips"
                    }
                ]
                
            },
            {
                name: translate('Colors'),
                icon: <MdOutlineColorLens />,
                label: 'colors',
                url: '/dashboard/design-system/colors'
            }
        ],
    },
];

export default _nav;
