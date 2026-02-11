{...}: {
  programs.aerospace = {
    enable = true;

    userSettings = {
      # Start AeroSpace at login
      start-at-login = true;
      accordion-padding = 30;
      automatically-unhide-macos-hidden-apps = true;

      # Mouse follows focus settings
      on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];
      on-focus-changed = ["move-mouse window-lazy-center"];

      # Gaps settings
      gaps = {
        inner.horizontal = 36;
        inner.vertical = 36;
        outer.left = 36;
        outer.bottom = 36;
        outer.top = 36;
        outer.right = 36;
      };

      mode.main.binding = {
        # Launch applications
        cmd-enter = "exec-and-forget open -a /Applications/Ghostty.app";
        cmd-d = "exec-and-forget open -a '/Applications/Alfred 5.app'";
        cmd-e = "exec-and-forget open -a Finder";

        # Window management
        cmd-q = "close";
        cmd-m = "fullscreen";
        cmd-shift-space = "layout floating tiling";

        # Focus movement
        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";
        alt-left = "focus left";
        alt-down = "focus down";
        alt-up = "focus up";
        alt-right = "focus right";

        # Window movement
        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        # Resize windows
        alt-shift-minus = "resize smart -50";
        alt-shift-equal = "resize smart +50";

        # Workspace management
        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";
        alt-6 = "workspace 6";
        alt-7 = "workspace 7";
        alt-8 = "workspace 8";
        alt-9 = "workspace 9";
        alt-0 = "workspace 10";

        # Move windows to workspaces
        alt-shift-1 = "move-node-to-workspace --focus-follows-window 1";
        alt-shift-2 = "move-node-to-workspace --focus-follows-window 2";
        alt-shift-3 = "move-node-to-workspace --focus-follows-window 3";
        alt-shift-4 = "move-node-to-workspace --focus-follows-window 4";
        alt-shift-5 = "move-node-to-workspace --focus-follows-window 5";
        alt-shift-6 = "move-node-to-workspace --focus-follows-window 6";
        alt-shift-7 = "move-node-to-workspace --focus-follows-window 7";
        alt-shift-8 = "move-node-to-workspace --focus-follows-window 8";
        alt-shift-9 = "move-node-to-workspace --focus-follows-window 9";
        alt-shift-0 = "move-node-to-workspace --focus-follows-window 10";

        # Workspace navigation
        cmd-tab = "workspace-back-and-forth";
        cmd-shift-tab = "move-workspace-to-monitor --wrap-around next";

        # Mode switching
        cmd-p = "mode passthrough";
      };

      # Passthrough mode
      mode.passthrough.binding = {
        cmd-p = "mode main";
        esc = "mode main";
      };

      # Window detection rules
      on-window-detected = [
        {
          "if".app-id = "us.zoom.xos";
          run = "move-node-to-workspace 9";
        }
      ];
    };
  };
}
