import { Widget } from "../lib/imports.js";

import Os from "./panels/Os.js";
import System from "./panels/System.js";
import Title from "./panels/Title.js";
import Tray from "./panels/Tray.js";
import Workspaces from "./panels/Workspaces.js";

const Start = () =>
  Widget.Box({ children: [Os(), Workspaces(), Title()], class_name: "start" });

const Center = () => Widget.Box({ class_name: "center" });

const End = () =>
  Widget.Box({ children: [Tray(), System()], class_name: "end", hpack: "end" });

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
