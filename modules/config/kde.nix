{ ... }:

{

  programs.plasma = {
    enable = true;
    overrideConfig = true;
    session.sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";

    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      iconTheme = "breeze-dark";
      cursor = {
        size = 24;
        theme = "Breeze";
      };

    };
    
    panels = [
      #System Tray + Clock Panel
      {
        alignment = "right";
        floating = true;
        height = 44;
        hiding = "autohide";
        lengthMode = "fit";
        location = "top";
        widgets = [
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];

      }
    ];

    kwin = {
      virtualDesktops.names = [
        "Left"
        "Centre"
        "Right"
      ];
      virtualDesktops.rows = 1;
      titlebarButtons.right = [
        "minimize"
        "maximize"
        "close"
      ];
    };

    hotkeys.commands = {
      "launch-kitty" = {
        name = "Launch Kitty";
        key = "Meta+Return";
        command = "kitty";
      };

      "launch-krunner" = {
        name = "Launch Krunner";
        key = "Meta+S";
        command = "krunner";
      };
    };
    shortcuts = {
      kwin = {
        "Window Maximize" = "Meta+Shift+W";
        "Window Close" = "Meta+Q";
        "Overview" = "Meta";
        "Kill Window" = "Meta+Shift+Q";
        "Switch One Desktop to the Left" = "Meta+1";
        "Switch One Desktop to the Right" = "Meta+2";
        "Window One Desktop to the Left" = "Meta+!";
        "Window One Desktop to the Right" = "Meta+";
        };
      krunner = {
        activateWhenTypingOnDesktop = "true";
        historyBehaviour = "enableSuggestions";
        position = "top";
        };
    };

    spectacle.shortcuts.captureRectangularRegion = "Meta+Shift+S";
  };
}
