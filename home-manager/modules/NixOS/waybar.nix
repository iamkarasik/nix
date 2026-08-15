{...}: let
  activeFg = "black";
  activeBg = "rgba(255, 255, 255, 1.0)";
  hoverBg = "rgba(255, 255, 255, 0.5)";
  barBg = "rgba(0, 0, 0, 0.0)";
  font = (import ../fonts/families.nix).sans;
in {
  programs.waybar = {
    enable = true;

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
          format = "{free}  ";
          tooltip = true;
          tooltip-format = "Disk Usage: {used} out of {total} ({percentage_used}%)";
          on-click = "thunar";
        };
        network = {
          format-ethernet = "{ipaddr}  ";
          tooltip = true;
          tooltip-format = "{ipaddr}";
          tooltip-format-ethernet = "{ifname}: {ipaddr}";
        };
        clock = {
          interval = 1;
          tooltip = true;
          tooltip-format = "{:%d/%M/%Y %H:%M:%S}";
          format = "{:%b %d, %H:%M:%S}";
        };
        cpu = {
          interval = 10;
          format = "{}%  ";
          max-length = 10;
        };
        "custom/cputemp" = {
          interval = 10;
          exec = "sensors | awk '/Tctl/ {print $2}'";
          format = "{}  ";
          tooltip-format = "CPU Temp: {}";
          tooltip = true;
        };
        memory = {
          interval = 10;
          format = "{used}G  ";
          tooltip-format = "Memory Usage: {used}G out of {total}G ({percentage}%)";
          tooltip = true;
        };
      };
    };

    style = ''
      * {
        font-size: 14px;
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
      }
    '';
  };
}
