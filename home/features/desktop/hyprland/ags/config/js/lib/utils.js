import * as Utils from "resource:///com/github/Aylur/ags/utils.js";

/** @param {Array<string>} bins */
export function dependencies(bins) {
  const deps = bins.map((bin) => {
    const has = Utils.exec(`which ${bin}`);
    if (!has) print(`missing dependency: ${bin}`);

    return !!has;
  });

  return deps.every((has) => has);
}
