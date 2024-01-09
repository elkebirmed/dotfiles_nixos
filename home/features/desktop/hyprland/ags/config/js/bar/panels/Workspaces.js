import { range } from "../../lib/utils.js";
import { Widget, Hyprland } from "../../lib/imports.js";

const dispatch = (ws) => Hyprland.sendMessage(`dispatch workspace ${ws}`);

export default () =>
  Widget.EventBox({
    on_scroll_up: () => dispatch("+1"),
    on_scroll_down: () => dispatch("-1"),
    class_name: "workspaces",
    child: Widget.CenterBox({
      start_widget: Widget.Box({ css: "min-width: 10px;" }),
      end_widget: Widget.Box({ css: "min-width: 10px;" }),
      center_widget: Widget.Box({
        children: range(10).map((i) =>
          Widget.Button({
            class_name: "workspaces-button icon-material",
            attribute: i,
            label: "radio_button_unchecked",
            on_clicked: () => dispatch(i),
            connections: [
              [
                Hyprland,
                (btn) =>
                  (btn.label =
                    Hyprland.active.workspace.id === i
                      ? "radio_button_checked"
                      : "radio_button_unchecked"),
              ],
            ],
          })
        ),
        setup: (self) =>
          self.hook(Hyprland, (box) =>
            box.children.forEach((btn) => {
              btn.visible = Hyprland.workspaces.some(
                // @ts-ignore
                (ws) => ws.id === btn.attribute
              );
            })
          ),
      }),
    }),
  });
