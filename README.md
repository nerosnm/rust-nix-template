# Rust + Nix Template

[![CI]][workflow]

This repository contains a (somewhat opinionated) [`cargo-generate`][generate] template for a Rust
project with optional [Nix flake][flakes] support.

## Usage

Install `cargo-generate` according to [the instructions][generate-install]. Then run:

```console
$ cargo generate nerosnm/rust-nix-template
```

[CI]: https://github.com/nerosnm/rust-nix-template/actions/workflows/build.yml/badge.svg?branch=main
[workflow]: https://github.com/nerosnm/rust-nix-template/actions/workflows/build.yml
[generate]: https://github.com/cargo-generate/cargo-generate
[flakes]: https://nixos.wiki/wiki/Flakes
[generate-install]: https://github.com/cargo-generate/cargo-generate#installation
