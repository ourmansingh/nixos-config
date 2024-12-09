{ pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
    wofi
    nautilus
  ];
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$menu" = "wofi";
      "$browser" = "firefox";

      bindm = [
        #Keyboard Brightness
        "$mod, ., exec, brightnessctl -d *::kbd_backlight set +1"
        "$mod, ,, exec, brightnessctl -d *::kbd_backlight set 1-"

        #Programs
        "$mod, Return, exec, kitty"
        "$mod, C, killactive"
        "$mod, S, exec, $menu"
        "$mod, F, exec, $browser"
        
        #Focus Shift
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        #Switch Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"

        #Move Windows Workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
      ];

    };
  };
}