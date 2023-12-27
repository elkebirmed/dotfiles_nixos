import Hyprland from "resource:///com/github/Aylur/ags/service/hyprland.js";
import { Box, Label, Button } from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

export const Workspaces = () =>
  Box({
    className: "unset workspaces",
    connections: [
      [
        Hyprland,
        (box) => {
          // generate an array [1..10] then make buttons from the index
          const arr = Array.from({ length: 10 }, (_, i) => i + 1);

          const activeIcons = [
            "",
            "",
            "",
            "󰉋",
            "󱙋",
            "󰆈",
            "",
            "󰺵",
            "󱋡",
            "",
          ];

          box.children = arr.map((i) =>
            Button({
              onClicked: () => execAsync(`hyprctl dispatch workspace ${i}`),
              child: Label({
                label: activeIcons[i - 1],
              }),
              className:
                Hyprland.active.workspace.name == i
                  ? "focused"
                  : Hyprland.workspaces.find((item) => item.name === i)
                      ?.windows > 0
                  ? "unfocused has-windows"
                  : "unfocused",
            })
          );
        },
      ],
    ],
  });
