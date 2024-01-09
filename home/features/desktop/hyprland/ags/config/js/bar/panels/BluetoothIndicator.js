import { Widget, Bluetooth } from "../../lib/imports.js";

// FIXME: Bluetooth not working
export default () =>
  Widget.EventBox({
    on_primary_click: () => Bluetooth.toggle(),
    child: Widget.Stack({
      class_name: "settings-middle bluetooth",
      transition: "slide_up_down",
      items: [
        [
          "true",
          Widget.Label({
            class_name: "icon-material",
            label: "bluetooth",
          }),
        ],
        [
          "false",
          Widget.Label({
            class_name: "icon-material",
            label: "bluetooth_disabled",
          }),
        ],
      ],
      setup: (self) =>
        self.hook(Bluetooth, (stack) => {
          stack.shown = String(Bluetooth.enabled);
        }),
    }),
  });
