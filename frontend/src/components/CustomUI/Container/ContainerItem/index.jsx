import React from "react";

export default function ContainerItem({
  children,
  sm,
  md,
  xl,
  padding,
  margin,
  className,
}) {
  return (
    <div
      className={`bg-black ${sm ? `sm-${sm}` : ""} ${md ? `md-${md}` : ""} ${
        xl ? `xl-${xl}` : ""
      } ${padding ? padding : ""} ${margin ? margin : ""} ${className}`}
    >
      {children}
    </div>
  );
}
