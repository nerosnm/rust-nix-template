# Rust + Nix Template

[![CI]][workflow]

This repository contains a (somewhat opinionated) [`cargo-generate`][generate] template for a Rust
project with optional [Nix flake][flakes] support.

## Usage

Install `cargo-generate` according to [the instructions][generate-install]. Then run:

```console
$ cargo generate nerosnm/rust-nix-template
```

## License

Licensed under either of

- Apache License, Version 2.0 ([LICENSE-APACHE](LICENSE-APACHE) or 
  http://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in the 
work by you, as defined in the Apache-2.0 license, shall be dual licensed as above, without any 
additional terms or conditions.

[CI]: https://github.com/nerosnm/rust-nix-template/actions/workflows/build.yml/badge.svg?branch=main
[workflow]: https://github.com/nerosnm/rust-nix-template/actions/workflows/build.yml
[generate]: https://github.com/cargo-generate/cargo-generate
[flakes]: https://nixos.wiki/wiki/Flakes
[generate-install]: https://github.com/cargo-generate/cargo-generate#installation
