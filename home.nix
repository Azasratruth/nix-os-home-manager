{ config, pkgs, ... }:

{

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "azasratruth";
  home.homeDirectory = "/home/azasratruth";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/azasratruth/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";

    # XDG_CURRENT_DESKTOP = "Hyprland";
    # XDG_SESSION_DESKTOP = "Hyprland";
    # XDG_SESSION_TYPE = "wayland";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Hyperland

  programs.kitty.enable = true; # required for the default Hyprland config
  # wayland.windowManager.hyprland.enable = true; # enable Hyprland

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   package = pkgs.hyprland;
  #   xwayland.enable = true;
  #   systemd.enable = true;

  #   settings = {
  #     monitor = [ ",preferred,auto,1" ];
  #     exec-once = [ "foot" ]; # or alacritty/wezterm
  #     input.kb_layout = "us";
  #     general.layout = "dwindle";
  #   };
  #   extraConfig = "";
  # };

  # home.sessionVariables = {
  #   XDG_CURRENT_DESKTOP = "Hyprland";
  #   XDG_SESSION_DESKTOP = "Hyprland";
  #   XDG_SESSION_TYPE = "wayland";
  # };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   package = pkgs.hyprland.override { wlroots = pkgs.wlroots_0_17; };
  #   xwayland.enable = true;
  #   systemd.enable = true;

  #   settings = {
  #     monitor = [ ",preferred,auto,1" ];
  #     exec-once = [ "foot" ];
  #     input.kb_layout = "us";
  #     general.layout = "dwindle";
  #   };

  #   extraConfig = "";
  # };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   package = pkgs.hyprland.override { wlroots = pkgs.wlroots_0_17; };
  #   xwayland.enable = true;
  #   systemd.enable = true;

  #   settings = {
  #     monitor = [ ",preferred,auto,1" ];
  #     exec-once = [ "foot" ];
  #     input.kb_layout = "us";
  #     general.layout = "dwindle";
  #   };

  #   extraConfig = "";
  # };

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    settings = {
      monitor = [ ",preferred,auto,1" ];
      exec-once = [ "foot" ];
      input.kb_layout = "us";
      general.layout = "dwindle";
    };

    extraConfig = "";
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   package = pkgs.hyprland;
  #   xwayland.enable = true;
  #   systemd.enable = true;

  #   settings = {
  #     monitor = [ ",preferred,auto,1" ]; # auto-detect output
  #     exec-once = [ "foot" ];
  #     input = { kb_layout = "us"; };
  #     general = { layout = "dwindle"; };
  #   };

  #   # Prevents parsing user config that may be invalid
  #   extraConfig = "";
  # };

  # Optional, hint Electron apps to use Wayland:
  # home.sessionVariables.NIXOS_OZONE_WL = "1";

  # wayland.windowManager.hyprland = {
  #   # Whether to enable Hyprland wayland compositor
  #   enable = true;
  #   # The hyprland package to use
  #   package = pkgs.hyprland;
  #   # Whether to enable XWayland
  #   xwayland.enable = true;

  #   # Optional
  #   # Whether to enable hyprland-session.target on hyprland startup
  #   systemd.enable = true;
  # };

  # wayland.windowManager.hyprland.settings = {
  #   "$mod" = "SUPER";
  #   bind = [ "$mod, F, exec, firefox" ", Print, exec, grimblast copy area" ]
  #     ++ (
  #       # workspaces
  #       # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
  #       builtins.concatLists (builtins.genList (i:
  #         let ws = i + 1;
  #         in [
  #           "$mod, code:1${toString i}, workspace, ${toString ws}"
  #           "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
  #         ]) 9));
  # };

  # # wayland.windowManager.hyprland.plugins = [
  # #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprbars
  # #   "/absolute/path/to/plugin.so"
  # # ];

  # # Fixing problems with themes 
  # home.pointerCursor = {
  #   gtk.enable = true;
  #   # x11.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 16;
  # };

  # theme
  # gtk = {
  #   enable = true;

  #   theme = {
  #     package = pkgs.flat-remix-gtk;
  #     name = "Flat-Remix-GTK-Grey-Darkest";
  #   };

  #   iconTheme = {
  #     package = pkgs.adwaita-icon-theme;
  #     name = "Adwaita";
  #   };

  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };

  # Programs don’t work in systemd services, but do on the terminal 
  # in home.nix:
  # wayland.windowManager.hyprland.systemd.variables = [ "--all" ];
  # This setting will produce the following entry in the Hyprland config:
  # hyprland.conf
  # exec-once = dbus-update-activation-environment --systemd --all

}
