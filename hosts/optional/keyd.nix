{ ... }:

{
  services.keyd = {
    enable = true;

    keyboards."*".settings = {
      main = {
        capslock = "overload(capslock_layer, esc)";
      };

      capslock_layer = {
        # Vim-like movement
        h = "left";
        j = "down";
        k = "up";
        l = "right";

        # <,>
        "," = "G-S-w";
        "." = "G-S-x";
      };
    };
  };
}
