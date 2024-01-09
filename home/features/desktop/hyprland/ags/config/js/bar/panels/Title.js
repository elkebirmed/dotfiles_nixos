import classIcon from "../../lib/classIcon.js";
import { Widget, Hyprland } from "../../lib/imports.js";

export default () =>
  Widget.Box({
    class_name: "title",
    children: [
      Widget.Icon({
        class_name: "title-icon",
      })
        .bind("icon", Hyprland.active, "client", (c) =>
          classIcon(c.class, c.title)
        )
        .bind(
          "visible",
          Hyprland.active,
          "client",
          (c) => classIcon(c.class, c.title) !== ""
        ),
      Widget.Label({
        class_name: "label",
      })
        .bind("label", Hyprland.active.client, "title", (t) =>
          t.length > 45 ? t.slice(0, 42) + "..." : t
        )
        .bind("tooltip_text", Hyprland.active.client, "title"),
    ],
  }).bind("visible", Hyprland.active.client, "title", (t) => t.length > 0);
