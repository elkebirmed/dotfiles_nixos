import {
  Window,
  CenterBox,
  Box,
  Label,
} from "resource:///com/github/Aylur/ags/widget.js";
import { execAsync } from "resource:///com/github/Aylur/ags/utils.js";

import { Workspaces } from "./widgets/workspace.js";
import { ClientTitle } from "./widgets/clientTitle.js";

const Clock = () =>
  Label({
    className: "clock",
    connections: [
      [
        1000,
        (label) =>
          execAsync(["date", "+(%I:%M) %A, %d %B"])
            .then((date) => (label.label = date))
            .catch(print),
      ],
    ],
  });

// layout of the bar
const Left = () =>
  Box({
    children: [
      Workspaces(),
      //   HardwareBox(),
      //   PrayerTimes(),
      // NotificationIndicator(),
      ClientTitle(),
    ],
  });

const Center = () =>
  Box({
    children: [Clock()],
  });

const Right = () =>
  Box({
    hpack: "end",
    children: [
      // Volume(),
      //   NotificationCenterButton(),
      //   Weather(),
      //   NetworkInformation(),
      //   SysTrayBox(),
      //   MenuButton,
    ],
  });

export const Bar = ({ monitor } = {}) =>
  Window({
    name: `bar${monitor || ""}`, // name has to be unique
    className: "bar-bg",
    monitor,
    anchor: ["top", "left", "right"],
    exclusivity: "exclusive",
    child: CenterBox({
      className: "bar shadow",
      startWidget: Left(),
      centerWidget: Center(),
      endWidget: Right(),
    }),
  });
