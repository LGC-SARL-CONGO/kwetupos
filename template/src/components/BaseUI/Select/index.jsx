import React, { useState, useRef, useEffect } from "react";
import { v4 as uuidv4 } from 'uuid'

import useScroll from "../../../hooks/useScroll";

import styles from "./Select.module.scss";
import useOutsideClick from "../../../useOut";
import { convertToBoolean } from "../../../_utils";

import { MdArrowDropDown } from "react-icons/md";
import { FaTimes } from "react-icons/fa";
import { MdOutlineCheckBoxOutlineBlank } from "react-icons/md";
import { MdCheckBox } from "react-icons/md";

const SelectedList = ({ items, unique, isWrapped, onRemove }) => {
    const [hiddenCount, setHiddenCount] = useState(0);
    const [hiddenItems, setHiddenItems] = useState([]);

    const selectedRef = useRef(null);
    const resizeTimeoutRef = useRef(null);

    useEffect(() => {
        const handleResize = () => {
            if (selectedRef.current?.offsetParent) {
                if (resizeTimeoutRef.current) {
                    clearTimeout(resizeTimeoutRef.current);
                }
                resizeTimeoutRef.current = setTimeout(limitVisibleItems, 20);
            }
        };

        const resizeObserver = new ResizeObserver(handleResize);

        const observeSelectedRef = () => {
            if (selectedRef.current?.offsetParent) {
                resizeObserver.observe(selectedRef.current?.offsetParent);
            }
        };

        observeSelectedRef();

        window.addEventListener("resize", handleResize);

        return () => {
            resizeObserver.disconnect();
            window.removeEventListener("resize", handleResize);
            clearTimeout(resizeTimeoutRef.current);
        };
    }, [items]);

    const limitVisibleItems = () => {
        setHiddenCount((prevCount) => {
            const parentContainer = selectedRef.current.offsetParent;
            const container = selectedRef.current;

            if (container && parentContainer) {
                container.style.width = `${parentContainer?.offsetWidth}px`;

                let totalWidth = 0;

                const childNodes = Array.from(container?.childNodes)?.filter(child => !child?.innerText?.includes('+'));

                childNodes?.forEach(child => {
                    if (!child?.originalWidth) child.originalWidth = child.offsetWidth + 20

                    totalWidth += child?.originalWidth;
                });

                if (!container?.totalWidth) container.totalWidth = totalWidth

                if (container?.totalWidth > parentContainer.offsetWidth + 10) {
                    let remainingWidth = parentContainer.clientWidth - 50;

                    childNodes?.forEach(child => {
                        if (remainingWidth >= child.originalWidth) {
                            remainingWidth -= child.originalWidth;
                            child.style.display = 'block'
                            child.hidden = false;
                        } else {
                            child.style.display = "none";
                            child.hidden = true;
                        }
                    });
                } else {
                    childNodes?.forEach(child => {
                        child.style.display = 'block'
                        child.hidden = false;
                    });
                }

                setHiddenItems(childNodes?.filter((child) => child?.hidden))

                return items?.length - childNodes?.filter((child) => !child?.hidden)?.length;
            }

            return prevCount;
        });
    };

    return <div
            className={`${styles["selected-list"]} ${unique && styles["selected-list--unique"] }`}
            style={{ padding: isWrapped ? "0 5px" : "5px 10px 5px 5px" }}
            ref={selectedRef}
        >
            {items?.map((current, index) => (
                <div key={index} className={styles["selected-list__selection"]}>
                    <div className="d-flex align-items-center">
                        {current.label}

                        {!unique && (
                            <FaTimes
                                className={styles["selected-list__selection--remove"]}
                                onClick={(event) => onRemove?.(event, current)}
                            />
                        )}
                    </div>
                </div>
            ))}

            {hiddenCount > 0 && <div className={styles["selected-list__selection"]}>+{hiddenCount}</div>}
    </div>
};

const SelectedListLabel = ({ items, listLabel }) => (
    <>
        {items?.length > 0 && (
            <div className={`${styles["selected-list"]} pl-1`}>
                <div className={styles["selected-list__selection"]} style={{marginTop: '5px'}}>
                    {items?.length > 1 ? (
                        <>
                            {items?.length} {listLabel}
                        </>
                    ) : (
                        <>{items[0]?.label}</>
                    )}
                </div>
            </div>
        )}
    </>
);

const OptionItem = ({ option, unique, onClick }) => (
    <li onClick={onClick} className={styles["option-item"]}>
        <div
            className={`${styles["option-item__item"]} ${option.checked ? styles["option-item__item--checked"] : ""
                }`}
        >
            {!unique && (
                <>
                    {!option.checked && (
                        <MdOutlineCheckBoxOutlineBlank className={styles["option-unchecked"]} />
                    )}
                    {option.checked && (
                        <MdCheckBox className={styles["option-checked"]} />
                    )}
                </>
            )}
            <span className={styles["option-item__name"]}>{option.label}</span>
        </div>
    </li>
);

const Select = ({
    label,
    options,
    selected,
    onSelected,
    unique,
    placeholder,
    valid,
    message,
    required,
    listLabel,
    disabled = false
}) => {
    const [selectionOptions, setSelectionOptions] = useState([]);
    const [currentSelection, setCurrentSelection] = useState([]);
    const [onSelect, setOnSelect] = useState(false);
    const [isWrapped, setIsWrapped] = useState(false);
    const [state, setState] = useState({ valid: undefined });

    const selectRef = useRef(null);
    const selectedRef = useRef(null);
    const optionsRef = useRef(null);
    const searchRef = useRef(null);

    const { top } = useScroll()

    const toogleDropdownId = `toggle-dropdown-${uuidv4()}`

    useEffect(() => {
        const values = selected ? options?.map((option) => ({
            ...option,
            ...(selected?.includes(option.value) && {checked: true})
        })) : options

        setCurrentSelection(
            values?.filter((option) => selected?.includes(option.value))
        );
        setSelectionOptions(values);
        setState({ valid: convertToBoolean(valid) });
    }, [options, selected, valid]);

    useEffect(() => {
        const checkWrap = () => {
            if (selectedRef.current) {
                const items = selectedRef.current.children;
                const lastItem = items[items.length - 1];
                const lastItemRect = lastItem?.getBoundingClientRect();
                setIsWrapped(lastItemRect?.top > 0);
            }
        };

        const handleResize = () => {
            checkWrap();
            changePosition();
        };

        checkWrap();
        changePosition();
        window.addEventListener("resize", handleResize);

        return () => {
            window.removeEventListener("resize", handleResize);
        };
    }, [currentSelection]);

    useEffect(() => {
        calculatePosition({target: document.getElementById(toogleDropdownId)})
    }, [top])

    useOutsideClick(selectRef, () => setOnSelect(false));

    const changePosition = () => {
        const optionsContainer = optionsRef?.current;
        const offsetHeight = selectedRef?.current?.offsetHeight;

        if (optionsContainer && offsetHeight > 45) {
            optionsContainer.style.bottom = `${offsetHeight + 5}px`;
        }
    };

    const handleToggleDropdown = (event) => {
        if (!onSelect && !disabled) {
            setOnSelect(!onSelect);
            setTimeout(() => searchRef?.current?.focus(), 0);
        }

        setState({ valid: undefined });
        calculatePosition(event);
    };

    const calculatePosition = (event) => {
        if (event) {
            const parentRect = event?.target?.getBoundingClientRect();
            const spaceAbove = parentRect?.top;
            const spaceBelow = window.innerHeight - parentRect?.bottom;

            setTimeout(() => {
                if (spaceAbove < spaceBelow) {
                    optionsRef?.current?.classList.remove(
                        `${styles["select-container__options--dropup"]}`
                    );
                } else {
                    changePosition();
                    optionsRef?.current?.classList.add(
                        `${styles["select-container__options--dropup"]}`
                    );
                }
            }, 1);
        }
    };

    const statusClass = () =>
        state?.valid !== undefined ? (state?.valid ? "--valid" : "--invalid") : "";

    const searchForOptions = (value) => {
        if (!value) {
            setSelectionOptions([...options]);
            return;
        }

        const values = options?.filter((option) =>
            option?.label?.toLowerCase().includes(value.toLowerCase())
        );
        setSelectionOptions([...values]);
    };

    const optionSelected = (option, index) => {
        if (unique) {
            setCurrentSelection([option]);
            onSelected?.([option]);
            setOnSelect(false);
            return;
        }

        const optionAlreadyExists = currentSelection?.findIndex(
            (current) => current.value === option.value
        );

        const optionIndex = options?.findIndex(
            (current) => current.value === option.value
        );

        const items = selectionOptions

        items[optionIndex].checked = !options[optionIndex]?.checked;

        setSelectionOptions([...items])

        if (optionAlreadyExists !== -1) {
            const values = currentSelection.filter(
                (_, i) => i !== optionAlreadyExists
            );
            setCurrentSelection(values);
            onSelected?.(values);
            return;
        }

        const values = [
            ...currentSelection,
            { ...option, checked: true },
        ];

        setCurrentSelection([...values]);
        onSelected?.([...values]);
    };

    const remove = (event, select) => {
        event?.stopPropagation()

        const values = currentSelection?.filter(current => current?.value !== select?.value)

        const optionIndex = options?.findIndex((option) => option.value === select.value);

        options[optionIndex].checked = !options[optionIndex]?.checked;

        setCurrentSelection([...values]);
        onSelected?.([...values]);
    }

    return (
        <div
            className={`${styles["select-container"]}`}
            ref={selectRef}
        >
            <label htmlFor={selectRef} className={styles["select-container__label"]}>
                <span>{label}</span>
                {required && label && (
                    <span className={styles["select-container__label--required"]}>*</span>
                )}
            </label>

            <div
                className={`${styles["select-container__selected"]} ${onSelect && styles["select-container__selected--active"]
                    } ${styles[`select-container__selected${statusClass()}`]} ${disabled && styles["select-container__selected--disabled"]
                }`}
                onClick={handleToggleDropdown}
                id={toogleDropdownId}
            >
                <input
                    type="text"
                    className={styles["select-container__selected--search"]}
                    ref={searchRef}
                    onChange={(event) => searchForOptions(event.target.value)}
                    disabled={disabled}
                />

                <div>
                    {!onSelect && (
                        <>
                            {!listLabel || listLabel === undefined ? (
                                <SelectedList
                                    items={currentSelection}
                                    unique={unique}
                                    isWrapped={isWrapped}
                                    onRemove={(event, current) => remove(event, current)}
                                />
                            ) : (
                                <SelectedListLabel
                                    items={currentSelection}
                                    listLabel={listLabel}
                                />
                            )}
                        </>
                    )}
                </div>

                <MdArrowDropDown
                    className={`${styles["icon-select"]} ${onSelect ? styles["icon-select--expanded"] : ""
                        }`}
                />
            </div>

            {onSelect && (
                <div style={{ position: "relative" }}>
                    <ul className={`${styles["select-container__options"]} ${!selectionOptions?.length && styles['select-container__options--no-data']}`} ref={optionsRef}>
                        {selectionOptions?.map((option, index) => (
                            <OptionItem
                                key={index}
                                option={option}
                                unique={unique}
                                onClick={() => optionSelected(option, index)}
                            />
                        ))}

                        {!selectionOptions?.length && <span>Sem dados</span>}
                    </ul>
                </div>
            )}
            {state?.valid !== undefined && (
                <span
                    className={`select-container__message ${styles[`select-container__message${statusClass()}`]
                        }`}
                >
                    {message || (state?.valid ? "Success" : "Error Text")}
                </span>
            )}
        </div>
    );
};

export default Select;
