import React, { useState, useEffect } from "react";
import { Prism as SyntaxHighlighter } from "react-syntax-highlighter";
import { oneLight } from "react-syntax-highlighter/dist/esm/styles/prism";
import { oneDark } from "react-syntax-highlighter/dist/esm/styles/prism";
import CopyToClipboard from "react-copy-to-clipboard";

import { useTheme } from '../../../hooks/useTheme';

import { MdContentCopy } from "react-icons/md";
import { MdCheck } from "react-icons/md";

import "./style.scss";

const CodeSnippet = ({ children }) => {
    const [copied, setCopied] = useState(false);
    const [trimmedCode, setTrimmedCode] = useState("");

    const theme = useTheme()

    useEffect(() => {
        const codeString = React.Children.toArray(children).join("");

        setTrimmedCode(removeLeadingWhitespace(codeString));
    }, [children]);

    useEffect(() => {
        setTimeout(() => {
            setCopied(false);
        }, 5000);
    }, [copied]);

    const removeLeadingWhitespace = (codeString) => {
        const lines = codeString.split("\n");
        const minIndentation = lines.reduce((minIndent, line) => {
            if (line.trim() === "") return minIndent;
            const leadingWhitespace = line.match(/^\s*/)[0].length;
            return Math.min(minIndent, leadingWhitespace);
        }, Infinity);

        const trimmedCode = lines
            .map((line) => line.slice(minIndentation))
            .join("\n");
        return trimmedCode;
    };

    return (
        <div style={{position: 'relative'}}>
            <div className="codesnippet-header">
                <CopyToClipboard
                    text={trimmedCode}
                    onCopy={() => setCopied(true)}
                >
                    <span className="codesnippet-header__copy">
                        {!copied ? (
                           <MdContentCopy className="codesnippet-header__copy--icon" />
                        ) : (
                            <>
                                <MdCheck className="codesnippet-header__copy--icon" />
                                <span className="codesnippet-header__copy--text">
                                    Copied!
                                </span>
                            </>
                        )}
                    </span>
                </CopyToClipboard>
            </div>

            <SyntaxHighlighter
                language="jsx"
                style={theme === 'dark' ? oneDark : oneLight}
                children={trimmedCode}
                wrapLines
                customStyle={{
                    margin: 0,
                    borderTopLeftRadius: 0,
                    borderTopRightRadius: 0,
                    paddingTop: 0,
                    background: theme === 'dark' ? '#2a3042' : '#F0F2F6'
                }}
            />
        </div>
    );
};

export default CodeSnippet;
