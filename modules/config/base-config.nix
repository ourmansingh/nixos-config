  
{ inputs, pkgs, ...}:

{
  #Firefox
  programs.firefox = {
      profiles.rhf = {
          name = "rhf";
          extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
              ublock-origin
              sponsorblock
              dearrow
              istilldontcareaboutcookies
              socialfocus
          ];

          search = {
              force = true;
              default = "StartPage";
              privateDefault = "StartPage";
              engines = {
                  "StartPage" = {
                      urls = [{template = "https://www.startpage.com/search?q={searchTerms}";}];
                      iconUpdateURL = "https://www.startpage.com/favicon.ico";
                  };
                  "Bing".metaData.hidden = true;
              };
          };

          bookmarks = {};
          settings = {
              "browser.startup.homepage" = "about:home";


              # Disable irritating first-run stuff
              "browser.disableResetPrompt" = true;
              "browser.download.panel.shown" = true;
              "browser.feeds.showFirstRunUI" = false;
              "browser.messaging-system.whatsNewPanel.enabled" = false;
              "browser.rights.3.shown" = true;
              "browser.shell.checkDefaultBrowser" = false;
              "browser.shell.defaultBrowserCheckCount" = 1;
              "browser.startup.homepage_override.mstone" = "ignore";
              "browser.uitour.enabled" = false;
              "startup.homepage_override_url" = "";
              "trailhead.firstrun.didSeeAboutWelcome" = true;
              "browser.bookmarks.restore_default_bookmarks" = false;
              "browser.bookmarks.addedImportButton" = true;

              # Don't ask for download dir
              "browser.download.useDownloadDir" = false;

              # Disable crappy home activity stream page
              "browser.newtabpage.activity-stream.feeds.topsites" = false;
              "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
              "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts" = false;
              # Disable some telemetry
              "app.shield.optoutstudies.enabled" = false;
              "browser.discovery.enabled" = false;
              "browser.newtabpage.activity-stream.feeds.telemetry" = false;
              "browser.newtabpage.activity-stream.telemetry" = false;
              "browser.ping-centre.telemetry" = false;
              "datareporting.healthreport.service.enabled" = false;
              "datareporting.healthreport.uploadEnabled" = false;
              "datareporting.policy.dataSubmissionEnabled" = false;
              "datareporting.sessions.current.clean" = true;
              "devtools.onboarding.telemetry.logged" = false;
              "toolkit.telemetry.archive.enabled" = false;
              "toolkit.telemetry.bhrPing.enabled" = false;
              "toolkit.telemetry.enabled" = false;
              "toolkit.telemetry.firstShutdownPing.enabled" = false;
              "toolkit.telemetry.hybridContent.enabled" = false;
              "toolkit.telemetry.newProfilePing.enabled" = false;
              "toolkit.telemetry.prompted" = 2;
              "toolkit.telemetry.rejected" = true;
              "toolkit.telemetry.reportingpolicy.firstRun" = false;
              "toolkit.telemetry.server" = "";
              "toolkit.telemetry.shutdownPingSender.enabled" = false;
              "toolkit.telemetry.unified" = false;
              "toolkit.telemetry.unifiedIsOptIn" = false;
              "toolkit.telemetry.updatePing.enabled" = false;

              # Disable fx accounts
              "identity.fxaccounts.enabled" = false;
              # Disable "save password" prompt
              "signon.rememberSignons" = false;
              # Harden
              "privacy.trackingprotection.enabled" = true;
              "dom.security.https_only_mode" = true;
              seen = ["save-to-pocket-button" "developer-button" "ublock0_raymondhill_net-browser-action" "_testpilot-containers-browser-action"];
          };
      };

      languagePacks = [
          "en-GB"
      ];

  };

  #VSCode
  programs.vscode = {
    enableExtensionUpdateCheck = true;
    enableUpdateCheck = true;
    extensions = with pkgs; [
        vscode-extensions.jnoortheen.nix-ide
        vscode-extensions.redhat.java
    ];
    userSettings = {
        "files.autosave" = "off";
        "nix.serverPath" ="nixd";
        "nix.enableLanguageServer" = true;
        "nix.serverSettings" = {
            "nixd" = {
                "formatting" = {
                    "command" = [ "alejandra" ];
                };
            };
        };
    };
  };

}
