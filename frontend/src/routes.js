import React from "react";

// Admin Views Page
const Dashboard = React.lazy(() => import("./views/pages/Ecommerce"));
const Analytics = React.lazy(() => import("./views/pages/Analytics"));
const Projects = React.lazy(() => import("./views/pages/Projects"));
const Calendar = React.lazy(() => import("./views/pages/Calendar"));
const Chat = React.lazy(() => import("./views/pages/Chat"));
const Prodcuts = React.lazy(() => import("./views/pages/Ecommerce/Prodcuts"));
const ProductDetail = React.lazy(() =>
  import("./views/pages/Ecommerce/ProductDetail")
);
const Orders = React.lazy(() => import("./views/pages/Ecommerce/Orders"));
const Customers = React.lazy(() => import("./views/pages/Ecommerce/Customers"));
const Sellers = React.lazy(() => import("./views/pages/Ecommerce/Sellers"));
const ProjectList = React.lazy(() =>
  import("./views/pages/Projects/ProjectsList")
);
const ProjectOverview = React.lazy(() =>
  import("./views/pages/Projects/ProjectOverview")
);
const FileManager = React.lazy(() => import("./views/pages/FileManager"));
const Email = React.lazy(() => import("./views/pages/Email"));
// const StarterPage = React.lazy(() => import("./views/pages/StarterPage"));
const CreateProject = React.lazy(() =>
  import("./views/pages/Projects/CreateProject")
);
const AccountSettings = React.lazy(() =>
  import("./views/pages/AccountSettings")
);
const Profile = React.lazy(() => import("./views/pages/Profile"));
const Kanbans = React.lazy(() => import("./views/pages/Kanbans"));
const CreateProduct = React.lazy(() =>
  import("./views/pages/Ecommerce/Prodcuts/CreateProduct")
);
const CreateUser = React.lazy(() =>
  import("./views/pages/UsersManagement/User/CreateUser")
);
const CreateRole = React.lazy(() =>
  import("./views/pages/UsersManagement/Roles/CreateRole")
);
// const Users = React.lazy(() => import("./views/pages/UsersManagement/Users"));
const Roles = React.lazy(() => import("./views/pages/UsersManagement/Roles"));
const User = React.lazy(() => import("./views/pages/UsersManagement/User"));
const SaleCommunicationAgent = React.lazy(() =>
  import("./views/pages/UsersManagement/SaleCommunicationAgent")
);

// Base UI
const Buttons = React.lazy(() => import("./views/components/Buttons"));
const Dropdowns = React.lazy(() => import("./views/components/Dropdowns"));
const Accordions = React.lazy(() => import("./views/components/Accordions"));
const Avatar = React.lazy(() => import("./views/components/Avatars"));
const AvatarGroups = React.lazy(() =>
  import("./views/components/AvatarGroups")
);
const Badges = React.lazy(() => import("./views/components/Badges"));
const Breadcrumb = React.lazy(() => import("./views/components/Breadcrumb"));
const ListGroups = React.lazy(() => import("./views/components/ListGroups"));
const Modals = React.lazy(() => import("./views/components/Modals"));
const Tab = React.lazy(() => import("./views/components/Tab"));
const Progress = React.lazy(() => import("./views/components/Progress"));
const Toasts = React.lazy(() => import("./views/components/Toasts"));
const Tooltips = React.lazy(() => import("./views/components/Tooltips"));
const Tables = React.lazy(() => import("./views/components/Tables"));
const Form = React.lazy(() => import("./views/components/Form"));
const Colors = React.lazy(() => import("./views/components/Colors"));
const Banners = React.lazy(() => import("./views/components/Banners"));
const Checkboxes = React.lazy(() => import("./views/components/Checkboxes"));
const Radios = React.lazy(() => import("./views/components/Radios"));
const Ranges = React.lazy(() => import("./views/components/Ranges"));
const InlineText = React.lazy(() => import("./views/components/InlineText"));
const ButtonGroups = React.lazy(() =>
  import("./views/components/ButtonGroups")
);

const routes = [
  // Views Page
  { path: "/", exact: true, name: "Home" },
  { path: "/dashboard", exact: true, name: "Dashboard", element: Dashboard },
  {
    path: "/dashboard/analytics",
    exact: true,
    name: "Analytics",
    element: Analytics,
  },
  {
    path: "/dashboard/projects",
    exact: true,
    name: "Projects",
    element: Projects,
  },
  {
    path: "/dashboard/calendar",
    exact: true,
    name: "Calendar",
    element: Calendar,
  },
  { path: "/dashboard/chat", exact: true, name: "Chat", element: Chat },
  { path: "/dashboard/chat", exact: true, name: "Chat", element: Chat },
  {
    path: "/dashboard/ecommerce/products",
    exact: true,
    name: "Prodcuts",
    element: Prodcuts,
  },
  {
    path: "/dashboard/ecommerce/product-details",
    exact: true,
    name: "ProductDetail",
    element: ProductDetail,
  },
  {
    path: "/dashboard/ecommerce/orders",
    exact: true,
    name: "Orders",
    element: Orders,
  },
  {
    path: "/dashboard/ecommerce/customers",
    exact: true,
    name: "Customers",
    element: Customers,
  },
  {
    path: "/dashboard/ecommerce/sellers",
    exact: true,
    name: "Sellers",
    element: Sellers,
  },
  {
    path: "/dashboard/ecommerce/products/create",
    exact: true,
    name: "CreateProduct",
    element: CreateProduct,
  },
  {
    path: "/dashboard/projects/all",
    exact: true,
    name: "ProjectList",
    element: ProjectList,
  },
  {
    path: "/dashboard/projects/detail/:id",
    exact: true,
    name: "ProjectOverview",
    element: ProjectOverview,
  },
  {
    path: "/dashboard/file/manager",
    exact: true,
    name: "FileManager",
    element: FileManager,
  },
  { path: "/dashboard/email", exact: true, name: "Email", element: Email },
  // {
  //   path: "/dashboard/starter-page",
  //   exact: true,
  //   name: "StarterPage",
  //   element: StarterPage,
  // },
  {
    path: "/dashboard/projects/create",
    exact: true,
    name: "CreateProject",
    element: CreateProject,
  },
  {
    path: "/dashboard/account/settings",
    exact: true,
    name: "AccountSettings",
    element: AccountSettings,
  },
  {
    path: "/dashboard/account/profile",
    exact: true,
    name: "Profile",
    element: Profile,
  },
  { path: "/dashboard/kanban", exact: true, name: "Kanbans", element: Kanbans },
  { path: "/dashboard/roles", exact: true, name: "Roles", element: Roles },
  { path: "/dashboard/user", exact: true, name: "User", element: User },
  {
    path: "/dashboard/users/create",
    exact: true,
    name: "CreateUser",
    element: CreateUser,
  },
  {
    path: "/dashboard/role/create",
    exact: true,
    name: "CreateRole",
    element: CreateRole,
  },
  {
    path: "/dashboard/sale-communication-agents",
    exact: true,
    name: "SaleCommunicationAgent",
    element: SaleCommunicationAgent,
  },

  // Components Docs
  {
    path: "/dashboard/design-system/accordions",
    exact: true,
    name: "Accordions",
    element: Accordions,
  },
  {
    path: "/dashboard/design-system/buttons",
    exact: true,
    name: "Buttons",
    element: Buttons,
  },
  {
    path: "/dashboard/design-system/dropdowns",
    exact: true,
    name: "Dropdowns",
    element: Dropdowns,
  },
  {
    path: "/dashboard/design-system/avatar",
    exact: true,
    name: "Avatar",
    element: Avatar,
  },
  {
    path: "/dashboard/design-system/avatar-group",
    exact: true,
    name: "AvatarGroups",
    element: AvatarGroups,
  },
  {
    path: "/dashboard/design-system/badges",
    exact: true,
    name: "Badges",
    element: Badges,
  },
  {
    path: "/dashboard/design-system/banners",
    exact: true,
    name: "Banners",
    element: Banners,
  },
  {
    path: "/dashboard/design-system/breadcrumbs",
    exact: true,
    name: "Breadcrumb",
    element: Breadcrumb,
  },
  {
    path: "/dashboard/design-system/list-group",
    exact: true,
    name: "ListGroups",
    element: ListGroups,
  },
  {
    path: "/dashboard/design-system/modals",
    exact: true,
    name: "Modals",
    element: Modals,
  },
  {
    path: "/dashboard/design-system/tabs",
    exact: true,
    name: "Tab",
    element: Tab,
  },
  {
    path: "/dashboard/design-system/progress",
    exact: true,
    name: "Progress",
    element: Progress,
  },
  {
    path: "/dashboard/design-system/toasts",
    exact: true,
    name: "Toasts",
    element: Toasts,
  },
  {
    path: "/dashboard/design-system/tooltips",
    exact: true,
    name: "Tooltips",
    element: Tooltips,
  },
  {
    path: "/dashboard/design-system/table-and-pagination",
    exact: true,
    name: "Tables",
    element: Tables,
  },
  {
    path: "/dashboard/design-system/form",
    exact: true,
    name: "Form",
    element: Form,
  },
  {
    path: "/dashboard/design-system/colors",
    exact: true,
    name: "Colors",
    element: Colors,
  },
  {
    path: "/dashboard/design-system/checkbox",
    exact: true,
    name: "Checkboxes",
    element: Checkboxes,
  },
  {
    path: "/dashboard/design-system/radio",
    exact: true,
    name: "Radios",
    element: Radios,
  },
  {
    path: "/dashboard/design-system/range",
    exact: true,
    name: "Ranges",
    element: Ranges,
  },
  {
    path: "/dashboard/design-system/inline-edit",
    exact: true,
    name: "InlineText",
    element: InlineText,
  },
  {
    path: "/dashboard/design-system/button-group",
    exact: true,
    name: "ButtonGroups",
    element: ButtonGroups,
  },
];

export default routes;
