{theme, ...}: let
  activeFg = theme.css theme.contrast;
  activeBg = theme.css theme.accent;
  hoverBg = "alpha(${theme.css theme.accentAlt}, 0.5)";
  barBg = "rgba(0, 0, 0, 0.0)";
  families = import ../fonts/families.nix;
  font = families.sans;
in {
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        "hyprland/workspaces" = {
          format = "{name}";
        };
        modules-left = [
          "custom/launcher"
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "custom/music"
          "tray"
          "network"
          "custom/cputemp"
          "cpu"
          "memory"
          "disk"
          "pulseaudio"
          "clock"
        ];
        "custom/music" = {
          return-type = "json";
          exec = "waybar-mpris --position --autofocus --order SYMBOL:ARTIST:TITLE --play '' --pause ''";
          on-click = "waybar-mpris --send toggle";
          escape = true;
        };
        "custom/launcher" = {
          format = " ";
          on-click = "powermenu";
          on-click-right = "pkill rofi";
        };
        pulseaudio = {
          tooltip = true;
          tooltip-format = "Volume: {volume}%";
          exec = "pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}'";
          scroll-step = 5;
          format = "{icon} ";
          format-muted = "🔇";
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          format-icons = {
            default = [
              ""
              ""
              ""
            ];
          };
        };
        tray = {
          icon-size = 20;
          spacing = 16;
        };
        "hyprland/window" = {
          format = "{initialTitle}";
        };
        disk = {
          interval = 10;
          format = " ";
          tooltip = true;
          tooltip-format = "Disk Usage: {used} out of {total} ({percentage_used}%)";
          on-click = "thunar";
          states = {
            warning = 75;
            critical = 90;
          };
        };
        network = {
          format-ethernet = " ";
          tooltip = true;
          tooltip-format = "{ipaddr}";
          tooltip-format-ethernet = "{ifname}: {ipaddr}";
        };
        clock = {
          interval = 1;
          tooltip = true;
          tooltip-format = "{:%d/%M/%Y %H:%M:%S}";
          format = "<span font_features='tnum=1'>{:%b %d, %H:%M:%S}</span>";
        };
        cpu = {
          interval = 10;
          format = " ";
          max-length = 10;
          tooltip = true;
          tooltip-format = "CPU: {usage}%";
          states = {
            warning = 75;
            critical = 90;
          };
        };
        "custom/cputemp" = {
          interval = 10;
          exec = ''sensors | awk '/Tctl/ { s = $2; n = s; sub(/^\+/, "", n); sub(/°C$/, "", n); n += 0; cls = (n >= 90 ? "critical" : (n >= 75 ? "warning" : "")); printf "{\"text\":\"%s\",\"tooltip\":\"CPU Temp: %s\",\"class\":\"%s\"}\n", s, s, cls }' '';
          return-type = "json";
          format = " ";
          tooltip = true;
        };
        memory = {
          interval = 10;
          format = " ";
          tooltip-format = "Memory Usage: {used}G out of {total}G ({percentage}%)";
          tooltip = true;
          states = {
            warning = 75;
            critical = 90;
          };
        };
      };
    };

    style = ''
      * {
        font-size: 13px;
        border: none;
        font-family: "${font}";
      }

      window#waybar {
        background-color: ${barBg};
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      .module {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 10px;
        padding-right: 10px;
      }

      #workspaces button:hover {
        background-color: ${hoverBg};
        color: ${activeFg};
      }

      #workspaces button.active {
        background-color: ${activeBg};
        color: ${activeFg};
      }

      #clock {
        margin-right: 20px;
      }

      #custom-launcher {
        margin-left: 20px;
        font-weight: bold;
      }

      #window,
      #custom-music,
      #tray,
      #network,
      #custom-cputemp,
      #cpu,
      #memory,
      #disk,
      #pulseaudio,
      #clock {
        font-weight: bold;
      }

      #cpu.warning,
      #memory.warning,
      #disk.warning,
      #custom-cputemp.warning {
        color: yellow;
      }

      #cpu.critical,
      #memory.critical,
      #disk.critical,
      #custom-cputemp.critical {
        color: red;
      }
    '';
  };
}
