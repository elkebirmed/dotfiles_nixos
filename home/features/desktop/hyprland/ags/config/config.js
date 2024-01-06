import TopBar from "./js/bar/TopBar.js";

import { init } from "./js/lib/setup.js";

const windows = () => [
  TopBar(),
];

export default {
  onConfigParsed: init,
  windows: windows(),
  maxStreamVolume: 1.05,
  cacheNotificationActions: false,
};
