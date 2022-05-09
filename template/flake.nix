{
  description = "{{project-name}}";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
    naersk.url = "github:nmattia/naersk";
  };

  outputs =
    { self
    , nixpkgs
    , flake-utils
    , rust-overlay
    , naersk
    } @ inputs:
    flake-utils.lib.eachDefaultSystem (system:
    let
      overlays = [ (import rust-overlay) ];
      pkgs = import nixpkgs { inherit system overlays; };

      rust-toolchain =
        (pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain).override {
          extensions = [ "rust-src" ];
        };

      nightly-rustfmt = pkgs.rust-bin.nightly.latest.rustfmt;

      naersk-lib = naersk.lib."${system}".override {
        cargo = rust-toolchain;
        rustc = rust-toolchain;
      };

      format-pkgs = with pkgs; [
        nixpkgs-fmt
      ];
    in
    rec
    {
      packages = rec {
        {{project-name}} = naersk-lib.buildPackage {
          pname = "{{project-name}}";
          root = ./.;
          nativeBuildInputs = with pkgs; [ ];
        };
        default = {{project-name}};
      };

      apps = rec {
        {{project-name}} = flake-utils.lib.mkApp {
          drv = packages.{{project-name}};
        };
        default = {{project-name}};
      };

      devShells.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          # The ordering of these two items is important. For nightly rustfmt to be used instead of 
          # the rustfmt provided by `rust-toolchain`, it must appear first in the list. This is 
          # because native build inputs are added to $PATH in the order they're listed here.
          nightly-rustfmt
          rust-toolchain
        ] ++ format-pkgs;
      };

      checks = {
        format = pkgs.runCommand
          "check-nix-format"
          { buildInputs = format-pkgs; }
          ''
            ${pkgs.nixpkgs-fmt}/bin/nixpkgs-fmt --check ${./.}
            touch $out
          '';
      };
    });
}
