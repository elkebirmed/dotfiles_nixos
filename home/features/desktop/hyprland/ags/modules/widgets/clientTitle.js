import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import {
  Box,
  Label,
  Button,
  Icon,
} from "resource:///com/github/Aylur/ags/widget.js";
import {
  execAsync,
  lookUpIcon,
} from "resource:///com/github/Aylur/ags/utils.js";
import { getIcon } from "../utils/getIcon.js";

export const ClientTitle = () =>
  Box({
    className: "unset client-title",
    connections: [
      [
        Hyprland,
        (box) => {
          box.children = [
            Icon({
              icon: getIcon(Hyprland.active.client.class),
            }),
            Label({
              label: Hyprland.active.client.title,
            }),
          ];
        },
      ],
    ],
  });
