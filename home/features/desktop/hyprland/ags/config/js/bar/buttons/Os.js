import { Utils, Widget } from "../../lib/imports.js";

export default () =>
  Widget.Box({
    class_name: "os",
    children: [
      Widget.Button({
        on_clicked: () => Utils.exec("wofi -S drun -x 10 -y 10 -W 25% -H 60%"),
        child: Widget.Label({
          class_name: "label icon-material",
          label: "rocket_launch",
        }),
      }),
    ],
  });
