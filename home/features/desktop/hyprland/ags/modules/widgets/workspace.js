import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import {
  Box,
  Label,
  Button,
  Icon,
} from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

export const Workspaces = () =>
  Box({
    className: "unset workspaces",
    connections: [
      [
        Hyprland,
        (box) => {
          box.children = Hyprland.workspaces.map((ws) =>
            Button({
              onClicked: () =>
                execAsync(`hyprctl dispatch workspace name:${ws.name}`),
              child: Label({
                label: "",
              }),
              className:
                Hyprland.active.workspace.name == ws.name
                  ? "focused"
                  : "unfocused",
            })
          );
        },
      ],
    ],
  });
