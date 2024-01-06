import { Widget, Box } from "resource:///com/github/Aylur/ags/widget.js";

import Os from "./buttons/Os.js";

const Start = () => Box({ children: [Os(),], class_name: "start", });

const Center = () => Box({ class_name: "center" });

const End = () => Box({ class_name: "end" });

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
