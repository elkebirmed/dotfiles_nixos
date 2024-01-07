import { App, Utils } from "./imports.js";
import { dependencies } from "./utils.js";

export function scssWatcher() {
  return Utils.subprocess(
    [
      "inotifywait",
      "--recursive",
      "--event",
      "create,modify",
      "-m",
      App.configDir + "/scss",
    ],
    reloadScss,
    () => print("missing dependancy for css hotreload: inotify-tools")
  );
}

/**
 * generate an scss file that makes every option available as a variable
 * based on the passed scss parameter or the path in the object
 *
 * e.g
 * options.bar.style.value => $bar-style
 */
export async function reloadScss() {
  if (!dependencies(["sassc"])) return;

  try {
    const tmp = "/tmp/ags/scss";
    Utils.ensureDirectory(tmp);
    await Utils.execAsync(
      `sassc ${App.configDir}/scss/main.scss ${tmp}/style.css`
    );
    App.resetCss();
    App.applyCss(`${tmp}/style.css`);
  } catch (error) {
    if (error instanceof Error) console.error(error.message);

    if (typeof error === "string") console.error(error);
  }
}
