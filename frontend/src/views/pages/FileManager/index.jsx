import React, { useState } from "react";

import { translate } from "../../../hooks/translate";

import AppPage from "../../../components/CustomUI/AppPage";
import Container from "../../../components/CustomUI/Container";
import ContainerItem from "../../../components/CustomUI/Container/ContainerItem";
import {
  Dropdown,
  DropdownContent,
  DropdownItem,
} from "../../../components/BaseUI/Dropdown";
import Files from "../../../components/CustomUI/Files";
import Folders from "../../../components/CustomUI/Folders";
import DisplayListOfFilesAndFolders from "../../../components/CustomUI/DisplayListOfFilesAndFolders";
import Button from "../../../components/BaseUI/Button";

import { MdOutlineCreateNewFolder } from "react-icons/md";
import { MdOutlineDriveFolderUpload } from "react-icons/md";
import { MdOutlineInsertDriveFile } from "react-icons/md";
import { MdOutlineUploadFile } from "react-icons/md";
import { MdGridView } from "react-icons/md";
import { MdKeyboardArrowDown } from "react-icons/md";
import { MdOutlineFolder } from "react-icons/md";
import { MdOutlineFolderShared } from "react-icons/md";
import { MdOutlineStarBorder } from "react-icons/md";
import { MdOutlineDelete } from "react-icons/md";
import { MdFolder } from "react-icons/md";
import { MdFolderShared } from "react-icons/md";
import { MdSnippetFolder } from "react-icons/md";
import { MdFolderZip } from "react-icons/md";
import { MdAdd } from "react-icons/md";
import { RiListCheck2 } from "react-icons/ri";
import { MdHistory } from "react-icons/md";

import styles from "./FileManager.module.scss";

export default function FileManager(props) {
  const actions = [
    { label: "Novo arquivo", icon: <MdOutlineInsertDriveFile /> },
    { label: "Fazer upload de arquivos", icon: <MdOutlineUploadFile /> },
    { label: "Nova pasta", icon: <MdOutlineCreateNewFolder /> },
    { label: "Carregar pasta", icon: <MdOutlineDriveFolderUpload /> },
  ];

  const files = [
    {
      name: "Atlassian Git Cheatsheet",
      type: "application/pdf",
      date: "02 Abril 2023",
      url: require("../../../assets/files/atlassian-git-cheatsheet.pdf"),
    },
    {
      name: "Visao do sistema Plus Car",
      type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      date: "09 Março 2023",
      url: require("../../../assets/files/Visao Do Sistema Plus Car.docx"),
    },
    {
      name: "Boat 7092",
      type: "video/mp4",
      date: "27 Novembro 2022",
      url: require("../../../assets/files/boat-7092.mp4"),
    },
    {
      name: "Chill Abstract Intention 12099",
      type: "audio/mpeg",
      date: "18 Janeiro 2023",
      url: require("../../../assets/files/chill-abstract-intention-12099.mp3"),
    },
    {
      name: "Nature",
      type: "video/mp4",
      date: "08 Junho 2022",
      url: require("../../../assets/files/nature.mp4"),
    },
    {
      name: "Pianchette Top",
      type: "image/jpeg",
      date: "08 Junho 2022",
      url: require("../../../assets/files/pianchette-top.jpeg"),
    },
    {
      name: "Git Cheatsheet",
      type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document",
      date: "08 Junho 2022",
      url: require("../../../assets/files/git cheatsheet.docx"),
    },
    {
      name: "Regex Cheatsheet",
      type: "application/pdf",
      date: "08 Junho 2022",
      url: require("../../../assets/files/regex_cheatsheet.pdf"),
    },
    {
      name: "Rocks 82",
      type: "image/jpeg",
      date: "08 Junho 2022",
      url: require("../../../assets/files/rocks-82.jpeg"),
    },
    {
      name: "Squirrel 82",
      type: "image/jpeg",
      date: "08 Junho 2022",
      url: require("../../../assets/files/squirrel-82.jpeg"),
    },
    {
      name: "Um Arquivo Simples",
      type: "text/plain",
      date: "12 Novembro 2023",
      url: require("../../../assets/files/um-arquivo-simples.txt"),
    },
    {
      name: "TAGS",
      type: "text/plain",
      date: "12 Novembro 2023",
      url: require("../../../assets/files/tags.txt"),
    },
    {
      name: "Um Olhar Profundo",
      type: "text/plain",
      date: "12 Novembro 2023",
      url: require("../../../assets/files/um-olhar-profundo.txt"),
    },
    {
      name: "Planilha financeira",
      type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      date: "12 Novembro 2023",
      url: require("../../../assets/files/Atividade 2 - Faxina Financeira.xlsx"),
    },
  ];

  const folders = [
    { name: "Backup", link: "", icon: <MdFolder />, date: "02 Abril 2023" },
    {
      name: "Migrations",
      link: "",
      icon: <MdSnippetFolder />,
      date: "07 Julho 2022",
    },
    { name: "Files", link: "", icon: <MdFolderZip />, date: "01 Janeiro 2023" },
    {
      name: "Portifolio",
      link: "",
      icon: <MdFolderShared />,
      date: "16 Setembro 2023",
    },
  ];

  const foldersList = [
    {
      name: translate("FILEMANAGER.MY_FILES"),
      icon: <MdOutlineFolder />,
      link: "",
    },
    {
      name: translate("FILEMANAGER.SHARED_WITH_ME"),
      icon: <MdOutlineFolderShared />,
      link: "",
    },
    { name: translate("FILEMANAGER.RECENT"), icon: <MdHistory />, link: "" },
    {
      name: translate("FILEMANAGER.FAVORITES"),
      icon: <MdOutlineStarBorder />,
      link: "",
    },
    { name: translate("UI.BIN"), icon: <MdOutlineDelete />, link: "" },
  ];

  const filesAndFolders = [...folders, ...files];

  const [selected, setSelected] = useState(foldersList[0]);
  const [currentView, setCurrentView] = useState("grid");

  const [gridView, setGridView] = useState([
    { active: false, type: "list" },
    { active: true, type: "grid" },
  ]);

  const handleChangeActiveGridView = (value) => {
    setGridView([...gridView]);
    setCurrentView(value);
  };

  return (
    <AppPage
      title={translate("FILEMANAGER.TITLE")}
      className={styles["file-manager-container"]}
      breadcrumbs={[
        { label: "KwetuPOS", url: "" },
        { label: translate("FILEMANAGER.TITLE") },
      ]}
      actions={
        <Dropdown
          trigger={
            <Button
              title={translate("New")}
              appearance="primary"
              useIcon={{
                direction: "left",
                icon: <MdAdd />,
              }}
            />
          }
          hideDropdownIcon={true}
          placement="top-end"
        >
          <DropdownContent className="create-event-container">
            {actions?.map((action, index) => (
              <DropdownItem key={index}>
                <span>{action.icon}</span>
                <span>{action.label}</span>
              </DropdownItem>
            ))}
          </DropdownContent>
        </Dropdown>
      }
    >
      <div className={styles["file-manager-container__content"]}>
        <div className={styles["manager__header"]}>
          <div className="d-flex align-items-center">
            <Dropdown
              trigger={
                <div>
                  {selected.icon} <MdKeyboardArrowDown />{" "}
                </div>
              }
              placement="top-start"
              hideDropdownIcon
            >
              <DropdownContent>
                {foldersList?.map((folder, index) => (
                  <DropdownItem
                    key={index}
                    onClick={() => setSelected(foldersList[index])}
                  >
                    <div className="d-flex align-items-center gap-1">
                      <span>{folder.icon}</span>
                      <span>{folder.name}</span>
                    </div>
                  </DropdownItem>
                ))}
              </DropdownContent>
            </Dropdown>

            <div className={styles["manager__selected"]}>{selected.name}</div>
          </div>

          <div className="d-flex align-items-center gap-1">
            <div className={styles["actions"]}>
              <div
                onClick={() => handleChangeActiveGridView("grid")}
                className={`${currentView === "grid" ? styles["active"] : ""}`}
              >
                <MdGridView />
              </div>

              <div
                onClick={() => handleChangeActiveGridView("list")}
                className={`${currentView === "list" ? styles["active"] : ""}`}
              >
                <RiListCheck2 />
              </div>
            </div>
          </div>
        </div>

        <div className={styles["manager__content"]}>
          {currentView === "grid" && (
            <>
              <Container>
                <ContainerItem sm={4} md={8} xl={12} className="mb-4">
                  <div className="label mb-3">
                    {translate("FILEMANAGER.FOLDERS")}
                  </div>

                  <Folders folders={folders} />
                </ContainerItem>
              </Container>

              <Container>
                <ContainerItem sm={4} md={8} xl={12}>
                  <div className="label mb-3">{translate("UI.FILES")}</div>

                  <Files files={files} />
                </ContainerItem>
              </Container>
            </>
          )}

          {currentView === "list" && (
            <Container>
              <ContainerItem sm={4} md={8} xl={12}>
                <DisplayListOfFilesAndFolders items={filesAndFolders} />
              </ContainerItem>
            </Container>
          )}
        </div>
      </div>
    </AppPage>
  );
}
