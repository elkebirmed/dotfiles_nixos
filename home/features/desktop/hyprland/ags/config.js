import { exec } from "resource:///com/github/Aylur/ags/utils.js";
import App from "resource:///com/github/Aylur/ags/app.js";
import Notifications from "resource:///com/github/Aylur/ags/service/notifications.js";

import { Bar } from "./modules/topbar.js";

const css = App.configDir + "/style.css";

export default {
  style: css,
  cacheNotificationActions: true,
  windows: [Bar()],
};

globalThis.getNot = () => Notifications;
