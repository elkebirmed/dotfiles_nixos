import { prettyTime } from "../../lib/utils.js";
import { Widget, Battery } from "../../lib/imports.js";

import Settings from "./Settings.js";

const Glib = imports.gi.GLib;

export default () =>
  Widget.EventBox({
    child: Widget.Box({
      class_name: "system",
      spacing: 15,
      children: [Settings(), BatteryPanel(), Clock()],
    }),
  });

const Clock = () =>
  Widget.Box({
    vpack: "center",
    class_name: "clock",
    setup: (self) =>
      self.poll(1000, () => {
        self.tooltip_text =
          Glib.DateTime.new_now_local().format("%A, %d-%m-%Y");
      }),
    child: Widget.Label({
      label: Glib.DateTime.new_now_local().format("%H:%M"),
      setup: (self) =>
        self.poll(1000, () => {
          self.label = Glib.DateTime.new_now_local().format("%H:%M");
        }),
    }),
  });

const BatteryPanel = () =>
  Widget.Box({
    class_name: "battery",
    children: [
      Widget.Stack({
        transition: "slide_up_down",
        items: [
          [
            "discharging",
            Widget.Label({
              class_name: "icon-material",
              label: "battery_full",
            }),
          ],
          [
            "charging",
            Widget.Label({
              class_name: "battery-icon icon-material",
              label: "bolt",
            }),
          ],
        ],
        setup: (self) =>
          self.hook(Battery, () => {
            self.shown = Battery.charging ? "charging" : "discharging";
          }),
      }),
      Widget.Label({
        setup: (self) =>
          self.hook(Battery, (label) => {
            label.label = `${Math.floor(Battery.percent)}%`;
          }),
        connections: [
          [
            Battery,
            (label) => {
              label.toggleClassName("battery-low", Battery.percent < 20);
              label.toggleClassName("battery-charging", Battery.charging);
            },
          ],
        ],
      }),
    ],
    binds: [["tooltip_text", Battery, "time_remaining", (t) => prettyTime(t)]],
  });
