import { lookUpIcon } from "resource:///com/github/Aylur/ags/utils.js";

export const getIcon = (icon) => {
  let _icon = icon.toLowerCase();

  if (lookUpIcon(_icon)) return _icon;
  return _icon;
};
