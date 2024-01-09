import { Widget } from "../../lib/imports.js";

import KeyboardLayout from "./KeyboardLayout.js";
import AudioIndicator from "./AudioIndicator.js";
import NetworkIndicator from "./NetworkIndicator.js";
import BluetoothIndicator from "./BluetoothIndicator.js";

export default () =>
  Widget.Box({
    class_name: "settings",
    children: [
      AudioIndicator(),
      KeyboardLayout(),
      BluetoothIndicator(),
      NetworkIndicator(),
    ],
  });
