import { init } from "./js/lib/setup.js";
import TopBar from "./js/bar/TopBar.js";
import ColorPicker from "./js/services/ColorPicker.js";

globalThis.ColorPicker = ColorPicker;

const windows = () => [TopBar()];

export default {
  onConfigParsed: init,
  windows: windows(),
  maxStreamVolume: 1.3,
  cacheNotificationActions: false,
};
