import { Widget, Network } from "../../lib/imports.js";

export default () =>
  Widget.Stack({
    transition: "slide_up_down",
    items: [
      ["fallback", SimpleNetworkIndicator()],
      ["wifi", NetworkWifiIndicator()],
      ["wired", NetworkWiredIndicator()],
    ],
    setup: (self) =>
      self.hook(Network, (stack) => {
        if (!Network.primary) {
          stack.shown = "wifi";
          return;
        }
        const primary = Network.primary || "fallback";
        if (primary == "wifi" || primary == "wired") stack.shown = primary;
        else stack.shown = "fallback";
      }),
  });

const NetworkWiredIndicator = () =>
  Widget.Stack({
    transition: "slide_up_down",
    items: [
      ["fallback", SimpleNetworkIndicator()],
      [
        "unknown",
        Widget.Label({
          class_name: "icon-material",
          label: "wifi_off",
        }),
      ],
      [
        "disconnected",
        Widget.Label({
          class_name: "icon-material",
          label: "signal_wifi_off",
        }),
      ],
      [
        "connected",
        Widget.Label({ class_name: "icon-material", label: "lan" }),
      ],
      [
        "connecting",
        Widget.Label({
          class_name: "icon-material",
          label: "settings_ethernet",
        }),
      ],
    ],
    setup: (self) =>
      self.hook(Network, (stack) => {
        if (!Network.wired) return;

        const { internet } = Network.wired;
        if (internet === "connected" || internet === "connecting")
          stack.shown = internet;
        else if (Network.connectivity !== "full") stack.shown = "disconnected";
        else stack.shown = "fallback";
      }),
  });

const SimpleNetworkIndicator = () =>
  Widget.Icon({
    setup: (self) =>
      self.hook(Network, (self) => {
        const icon = Network[Network.primary || "wifi"]?.icon_name;
        self.icon = icon || "";
        self.visible = icon.length > 0;
      }),
  });

const NetworkWifiIndicator = () =>
  Widget.Stack({
    transition: "slide_up_down",
    items: [
      [
        "disabled",
        Widget.Label({
          class_name: "icon-material",
          label: "wifi_off",
        }),
      ],
      [
        "disconnected",
        Widget.Label({
          class_name: "icon-material",
          label: "signal_wifi_off",
        }),
      ],
      [
        "connecting",
        Widget.Label({
          class_name: "icon-material",
          label: "settings_ethernet",
        }),
      ],
      [
        "0",
        Widget.Label({
          class_name: "icon-material",
          label: "signal_wifi_0_bar",
        }),
      ],
      [
        "1",
        Widget.Label({
          class_name: "icon-material",
          label: "network_wifi_1_bar",
        }),
      ],
      [
        "2",
        Widget.Label({
          class_name: "icon-material",
          label: "network_wifi_2_bar",
        }),
      ],
      [
        "3",
        Widget.Label({
          class_name: "icon-material",
          label: "network_wifi_3_bar",
        }),
      ],
      [
        "4",
        Widget.Label({
          class_name: "icon-material",
          label: "signal_wifi_4_bar",
        }),
      ],
    ],
    setup: (self) =>
      self.hook(Network, (stack) => {
        if (!Network.wifi) {
          return;
        }
        if (Network.wifi.internet == "connected") {
          stack.shown = String(Math.ceil(Network.wifi.strength / 25));
        } else if (
          Network.wifi.internet == "disconnected" ||
          Network.wifi.internet == "connecting"
        ) {
          stack.shown = Network.wifi.internet;
        }
      }),
  });
