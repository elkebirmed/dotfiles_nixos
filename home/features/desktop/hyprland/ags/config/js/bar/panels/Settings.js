import { Widget, Network, Bluetooth, Audio, Mpris } from "../../lib/imports.js";

export default () =>
  Widget.Box({
    class_name: "settings",
    children: [AudioIndicator(), BluetoothIndicator(), NetworkIndicator()],
  });

const NetworkIndicator = () =>
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

const AudioIndicator = () =>
  Widget.EventBox({
    class_name: "audio",
    on_primary_click: () => {
      if (!Audio.speaker) return;
      Audio.speaker.is_muted = !Audio.speaker.is_muted;
    },
    on_scroll_up: () => {
      if (!Audio.speaker) return;
      Audio.speaker.volume = Audio.speaker.volume + 0.05;
    },
    on_scroll_down: () => {
      if (!Audio.speaker) return;
      Audio.speaker.volume = Math.min(0, Audio.speaker.volume - 0.05);
    },
    child: Widget.Stack({
      transition: "slide_up_down",
      items: [
        [
          "true",
          Widget.Label({
            class_name: "icon-material",
          }).hook(
            Audio,
            (self) => {
              if (!Audio.speaker) return;

              const vol = Math.floor(Audio.speaker.volume * 100);

              self.tooltip_text = `Volume: ${vol}%`;

              if (vol == 0) {
                self.label = "volume_off";
              } else if (vol <= 33) {
                self.label = "volume_mute";
              } else if (vol <= 66) {
                self.label = "volume_down";
              } else if (vol > 100) {
                self.label = "sound_detection_loud_sound";
              } else {
                self.label = "volume_up";
              }
            },
            "speaker-changed"
          ),
        ],
        [
          "false",
          Widget.Label({ class_name: "icon-material", label: "volume_off" }),
        ],
      ],
      setup: (self) =>
        self.hook(Audio, (stack) => {
          stack.shown = String(!Audio.speaker?.stream.is_muted);
        }),
    }),
  });

// FIXME: Bluetooth not working
const BluetoothIndicator = () =>
  Widget.EventBox({
    on_primary_click: () => Bluetooth.toggle(),
    child: Widget.Stack({
      class_name: "settings-middle bluetooth",
      transition: "slide_up_down",
      items: [
        [
          "true",
          Widget.Label({
            class_name: "icon-material",
            label: "bluetooth",
          }),
        ],
        [
          "false",
          Widget.Label({
            class_name: "icon-material",
            label: "bluetooth_disabled",
          }),
        ],
      ],
      setup: (self) =>
        self.hook(Bluetooth, (stack) => {
          stack.shown = String(Bluetooth.enabled);
        }),
    }),
  });
