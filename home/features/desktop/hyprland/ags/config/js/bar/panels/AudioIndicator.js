import { Widget, Audio } from "../../lib/imports.js";

export default () =>
  Widget.EventBox({
    class_name: "settings-audio",
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
