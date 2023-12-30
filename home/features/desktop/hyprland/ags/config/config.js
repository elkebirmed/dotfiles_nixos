import App from "resource:///com/github/Aylur/ags/app.js";
import { timeout } from "resource:///com/github/Aylur/ags/utils.js";

timeout(1000, () => JSON.stringify(App));

const windows = () => [];

export default {
  windows: windows().flat(1),
  maxStreamVolume: 1.05,
  cacheNotificationActions: false,
};
