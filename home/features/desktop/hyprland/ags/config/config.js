import TopBar from "./js/bar/TopBar.js";
import Notifications from "./js/notifications/Notifications.js";
import Dashboard from "./js/dashboard/Dashboard.js";
import Applauncher from "./js/applauncher/Applauncher.js";
import Overview from "./js/overview/Overview.js";
import PowerMenu from "./js/powermenu/PowerMenu.js";
import Verification from "./js/powermenu/Verification.js";
import QuickSettings from "./js/quicksettings/QuickSettings.js";

import { init } from "./js/settings/setup.js";
import { initWallpaper } from "./js/settings/wallpaper.js";
import { forMonitors } from "./js/utils.js";

const windows = () => [
  // forMonitors(Desktop),
  // forMonitors(FloatingDock),
  // forMonitors(Lockscreen),
  forMonitors(Notifications),
  // forMonitors(OSD),
  // forMonitors(ScreenCorners),
  forMonitors(TopBar),
  Applauncher(),
  Dashboard(),
  Overview(),
  PowerMenu(),
  QuickSettings(),
  Verification(),
];

initWallpaper();

export default {
  onConfigParsed: init,
  windows: windows().flat(1),
  maxStreamVolume: 1.05,
  cacheNotificationActions: false,
};
