{pkgs, ...}: {
  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;

    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
    };

    profiles.default = {
      isDefault = true;

      pinsForce = true;

      pins = {
        "NixOS Search" = {
          url = "https://search.nixos.org";
          position = 100;
          isEssential = true;
          id = "1";
        };
        "YouTube" = {
          url = "https://youtube.com";
          position = 200;
          isEssential = true;
          id = "2";
        };
        "Gemini" = {
          url = "https://gemini.google.com/app";
          position = 300;
          isEssential = true;
          id = "3";
        };
        "ChatGPT" = {
          url = "https://chatgpt.com";
          position = 400;
          isEssential = true;
          id = "4";
        };
      };

      search = {
        force = true;
        default = "google";
        engines = {
          nixos = {
            name = "nixos";
            urls = [
              {
                template = "https://search.nixos.org/packages?query={searchTerms}";
              }
            ];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nx"];
          };
          github = {
            name = "GitHub Search";
            urls = [
              {
                template = "https://github.com/search?q={searchTerms}";
              }
            ];
            definedAliases = ["@gh"];
          };
        };
      };

      settings = {
        "zen.workspaces.continue-where-left-off" = false;
        "zen.view.compact.hide-tabbar" = false;
        "zen.urlbar.behavior" = "float";

        "zen.welcome-screen.seen" = true;
        "browser.aboutwelcome.enabled" = false;
      };
    };
  };
}
