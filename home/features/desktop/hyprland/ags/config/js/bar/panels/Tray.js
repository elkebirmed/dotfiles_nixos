import { SystemTray, Widget } from "../../lib/imports.js";

export default () =>
  Widget.Box({
    class_name: "tray",
    spacing: 6,
    binds: [
      ["children", SystemTray, "items", (i) => i.map(SystemTrayItem)],
      ["visible", SystemTray, "items", (i) => i.length > 0],
    ],
  });

const SystemTrayItem = (item) =>
  Widget.Button({
    child: Widget.Icon({ class_name: "tray-icon" }).bind("icon", item, "icon"),
    tooltip_markup: item.bind("tooltip-markup"),
    on_primary_click: (_, event) => item.activate(event),
    on_secondary_click: (_, event) => item.openMenu(event),
  });
