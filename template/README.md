# {{project-name}}
{% if github_actions %}
[![CI]][workflow]
{% endif %}{% if crate_type == "lib" %}
## Usage

Add the following to the `[dependencies]` section of your `Cargo.toml` file:

```toml
{{project-name}} = "0.1.0"
```
{% else %}
## Installation

### Using `cargo`

```console
$ cargo install {{project-name}}
```
{% endif %}
## Contributing

This project uses a `rust-toolchain` file to specify which version of the Rust compiler should 
be used, which `rustup` should detect and install for you.
{% if nix %}
This repository also contains a [Nix flake](https://nixos.wiki/wiki/Flakes) that sets up 
an appropriate Rust toolchain. Run `nix develop` or `direnv allow` to load the `devShell` flake 
output, according to your preference.
{% endif %}{% if dual_license %}
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
{% endif %}{% if github_actions %}
[CI]: https://github.com/{{github_username}}/{{project-name}}/actions/workflows/ci.yml/badge.svg?branch=main
[workflow]: https://github.com/{{github_username}}/{{project-name}}/actions/workflows/ci.yml
{% endif %}
