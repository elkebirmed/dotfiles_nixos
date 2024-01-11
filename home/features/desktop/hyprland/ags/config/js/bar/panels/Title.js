import classIcon from "../../lib/classIcon.js";
import { Widget, Hyprland } from "../../lib/imports.js";

export default () =>
  Widget.Box({
    class_name: "title",
    spacing: 8,
    children: [
      Widget.Icon({
        class_name: "title-icon",
        binds: [
          [
            "icon",
            Hyprland.active,
            "client",
            (c) => classIcon(c.class, c.title),
          ],
          [
            "visible",
            Hyprland.active,
            "client",
            (c) => classIcon(c.class, c.title) !== "",
          ],
        ],
      }),
      Widget.Label({
        class_name: "label",
        truncate: "end",
        max_width_chars: 45,
        binds: [
          ["label", Hyprland.active.client, "title"],
          ["tooltip_text", Hyprland.active.client, "title"],
        ],
      }),
    ],
    binds: [["visible", Hyprland.active.client, "title", (t) => t.length > 0]],
  });
