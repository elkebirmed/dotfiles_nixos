import { Notifications, Utils, Widget } from "../../lib/imports.js";

export default () =>
  Widget.Revealer({
    reveal_child: false,
    connections: [
      [
        Notifications,
        (revealer) => {
          revealer.reveal_child = Notifications.notifications.length > 0;
        },
      ],
    ],
    child: Widget.Box({
      class_name: "notification",
      setup: (self) =>
        self.hook(Notifications, (stack) => {
          print(Notifications.notifications.length);

          Notifications.notifications.forEach((n) => {
            print(n.summary);
          });
        }),
      children: [
        Widget.Label({ class_name: "icon-material", label: "notifications" }),
        Widget.Label().bind("label", Notifications, "notifications", (n) =>
          n.length.toString()
        ),
      ],
    }),
  });
