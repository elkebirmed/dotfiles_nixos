import { exec } from "resource:///com/github/Aylur/ags/utils.js";
import { Label } from "resource:///com/github/Aylur/ags/widget.js"

import FontIcon from "../../lib/FontIcon.js";
import PanelButton from "../PanelButton.js";

export default () =>
  PanelButton({
    class_name: "os",
    on_clicked: () => exec("wofi -S drun -x 10 -y 10 -W 25% -H 60%"),
    content: FontIcon("󱄅"),
  });
