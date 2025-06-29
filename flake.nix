{
  description = "Home Manager configuration of azasratruth";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      # inputs.hyprland.url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      # pkgs = nixpkgs.legacyPackages.${system};
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # ✅ Overlay Hyprland with wlroots_0_17
          (final: prev: {
            hyprland = prev.hyprland.overrideAttrs (old: {
              buildInputs = (old.buildInputs or [ ]) ++ [ prev.wlroots_0_17 ];
            });
          })
        ];
      };
    in {
      homeConfigurations."azasratruth" =
        home-manager.lib.homeManagerConfiguration {
          inherit pkgs;

          # Specify your home configuration modules here, for example,
          # the path to your home.nix.
          modules = [ ./home.nix ];

          # Optionally use extraSpecialArgs
          # to pass through arguments to home.nix
        };
    };
}
