import App from "resource:///com/github/Aylur/ags/app.js";
import PanelButton from "../PanelButton.js";
import FontIcon from "../../misc/FontIcon.js";
import { distroIcon } from "../../variables.js";
import options from "../../options.js";
import { exec } from "resource:///com/github/Aylur/ags/utils.js";

export default () =>
  PanelButton({
    class_name: "overview",
    window: "overview",
    on_clicked: () => exec("wofi -S drun -x 10 -y 10 -W 25% -H 60%"),
    on_secondary_click: () => App.toggleWindow("overview"),
    content: FontIcon({
      binds: [
        [
          "icon",
          options.bar.icon,
          "value",
          (v) => {
            return v === "distro-icon" ? distroIcon : v;
          },
        ],
      ],
    }),
  });
