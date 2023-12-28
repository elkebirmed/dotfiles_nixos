import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import {
  Box,
  Label,
  Button,
  Icon,
} from "resource:///com/github/Aylur/ags/widget.js";
import { getIcon, truncateText } from "../utils/helpers.js";

export const ClientTitle = () =>
  Box({
    visible: Hyprland.active.workspace.windows > 0,
    className: "unset client-title",
    connections: [
      [
        Hyprland,
        (box) => {
          box.children = [
            getIcon(Hyprland.active.client.class)
              ? Icon({
                  icon: getIcon(Hyprland.active.client.class),
                  size: 22,
                })
              : Box(),
            Label({
              label: truncateText(Hyprland.active.client.title, 50),
            }),
          ];
        },
      ],
    ],
  }).bind("visible", Hyprland.active.workspace, "id", (id) => {
    const clients = Hyprland.clients.filter((c) => c.workspace.id == id);
    console.log(id);
    console.log(clients);
    return !!clients.length;
  });
