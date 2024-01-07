import { Widget } from "../lib/imports.js";

import Os from "./buttons/Os.js";
import Workspaces from "./buttons/Workspaces.js";

const Start = () =>
  Widget.Box({ children: [Os(), Workspaces()], class_name: "start" });

const Center = () => Widget.Box({ class_name: "center" });

const End = () => Widget.Box({ class_name: "end" });

export default () =>
  Widget.Window({
    name: "bar",
    class_name: "bar",
    exclusivity: "exclusive",
    anchor: ["top", "left", "right"],
    child: Widget.CenterBox({
      class_name: "panel",
      start_widget: Start(),
      center_widget: Center(),
      end_widget: End(),
    }),
  });
