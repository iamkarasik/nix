{
  pkgs,
  config,
  ...
}: let
  fonts = config.iamkarasik.fonts;
  theme = config.iamkarasik.theme;
  wallpaper = config.iamkarasik.wallpaper;

  terminal = "ghostty";
  fileManager = "thunar";
  menu = "rofi --show drun";
  mainMod = "SUPER";

  workspaceBinds = builtins.concatLists (builtins.genList (i: let
      ws = toString (i + 1);
      key = toString (
        if i + 1 == 10
        then 0
        else i + 1
      );
    in [
      "${mainMod}, ${key}, workspace, ${ws}"
      "${mainMod} SHIFT, ${key}, movetoworkspace, ${ws}"
    ])
    10);
in {
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;

    settings = {
      monitor = [",highrr,auto,auto"];

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,macOS"
        "HYPRCURSOR_SIZE,24"
      ];

      "exec-once" = [
        "discord --start-minimized"
        "swaybg -i ${wallpaper} -m fill"
      ];

      ecosystem.no_update_news = true;

      general = {
        gaps_in = 12;
        gaps_out = 46;
        border_size = 1;
        "col.active_border" = "${theme.hypr theme.accent "ff"} ${theme.hypr theme.accent "ff"} 45deg";
        "col.inactive_border" = theme.hypr theme.inactive "aa";
        resize_on_border = false;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 8;
          passes = 3;
          vibrancy = 0.1696;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];

        animation = [
          "global, 1, 10, default"
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master.new_status = "master";

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "";
        kb_rules = "";
        follow_mouse = 1;
        sensitivity = -0.7;
        repeat_rate = 75;
        repeat_delay = 200;
        touchpad.natural_scroll = false;
      };

      bind =
        [
          "${mainMod} SHIFT, H, movewindow, l"
          "${mainMod} SHIFT, L, movewindow, r"
          "${mainMod} SHIFT, K, movewindow, u"
          "${mainMod} SHIFT, J, movewindow, d"

          "${mainMod} SHIFT, left, movewindow, l"
          "${mainMod} SHIFT, right, movewindow, r"
          "${mainMod} SHIFT, up, movewindow, u"
          "${mainMod} SHIFT, down, movewindow, d"

          "${mainMod}, Return, exec, ${terminal}"
          "${mainMod}, C, killactive,"
          "${mainMod}, M, exit,"
          "${mainMod}, E, exec, ${fileManager}"
          "${mainMod}, Space, togglefloating,"
          "${mainMod}, R, exec, ${menu}"
          "${mainMod}, P, pseudo,"
          "${mainMod}, J, togglesplit,"
          "${mainMod}, F, fullscreen"
          "${mainMod}, D, exec, rofi -show drun"

          "${mainMod} CONTROL, h, resizeactive, -40 0"
          "${mainMod} CONTROL, l, resizeactive, 40 0"
          "${mainMod} CONTROL, k, resizeactive, 0 -40"
          "${mainMod} CONTROL, j, resizeactive, 0 40"

          "${mainMod} CONTROL, left, resizeactive, -40 0"
          "${mainMod} CONTROL, right, resizeactive, 40 0"
          "${mainMod} CONTROL, up, resizeactive, 0 -40"
          "${mainMod} CONTROL, down, resizeactive, 0 40"

          "${mainMod}, H, movefocus, l"
          "${mainMod}, L, movefocus, r"
          "${mainMod}, K, movefocus, u"
          "${mainMod}, J, movefocus, d"

          "${mainMod}, left, movefocus, l"
          "${mainMod}, right, movefocus, r"
          "${mainMod}, up, movefocus, u"
          "${mainMod}, down, movefocus, d"

          "${mainMod}, S, togglespecialworkspace, magic"
          "${mainMod} SHIFT, S, movetoworkspace, special:magic"

          "${mainMod}, mouse_down, workspace, e+1"
          "${mainMod}, mouse_up, workspace, e-1"

          ''${mainMod} SHIFT, backspace, exec, ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp -w 0)" - | ${pkgs.wl-clipboard}/bin/wl-copy''
        ]
        ++ workspaceBinds;

      bindm = [
        "${mainMod}, mouse:272, movewindow"
        "${mainMod}, mouse:273, resizewindow"
      ];

      windowrule = [
        "float, title:Calculator"
        "float, class:thunar"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      layerrule = [
        "blur, waybar"
        "ignorealpha 0.3, waybar"
      ];
    };
  };

  services.hyprpolkitagent.enable = true;
  services.network-manager-applet.enable = true;

  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        hide_cursor = true;
        grace = 0;
      };

      background = [
        {
          path = "${wallpaper}";
          blur_passes = 3;
          blur_size = 5;
        }
      ];

      label = [
        {
          text = ''
            cmd[update:1000] echo "$(date +"%H:%M:%S")";
          '';
          color = theme.hypr theme.fg "ff";
          font_size = 64;
          font_family = fonts.mono;
          position = "0, 160";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = [
        {
          size = "300, 60";
          rounding = 30;
          outline_thickness = 4;
          outer_color = theme.hypr theme.accent "ff";
          inner_color = theme.hypr theme.bg "cc";
          font_color = theme.hypr theme.fg "ff";
          check_color = theme.hypr theme.accent "ff";
          fail_color = theme.hypr theme.urgent "ff";
          fade_on_empty = false;
          placeholder_text = "";
          position = "0, -40";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  services.hypridle = {
    enable = true;
    settings = {
      general.lock_cmd = "${pkgs.procps}/bin/pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";

      listener = [
        {
          timeout = 600;
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 1800;
          on-timeout = "${pkgs.hyprland}/bin/hyprctl dispatch dpms off";
          on-resume = "${pkgs.hyprland}/bin/hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
