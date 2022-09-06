# install-riff-action

This GitHub Action installs [Riff] in your CI pipeline. Riff is a tool that
automatically provides external dependencies for software projects. It currently
works with [Rust] projects but additional language support will be added soon.

Here's an example Actions pipeline that uses `install-riff-action`:

```yaml
jobs:
  build-release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Install Nix
        uses: cachix/install-nix-action@v17
      - name: Install Rust
        uses: actions-rs/toolchain@v1
        with:
          toolchain: stable
      - name: Install Riff
        uses: DeterminateSystems/install-riff-action@v1
      - name: Build release
        run: riff run cargo build -- --release
```

As in the example above, you need to have both [Nix] and [Cargo] installed in
your pipeline for Riff to work. The [`cachix/install-nix-action`][install-nix]
and [`actions-rs/toolchain`][toolchain] Actions work well for that (and are used
in our [tests](./.github/workflows/test.yml)) but you can use other installation
methods if you wish.

## Configuration

You can supply a specific Riff version using the `riff_version` parameter:

```yaml
- name: Install Riff
  uses: DeterminateSystems/install-riff-action@v1
  with:
    riff_version: "1.0.0"
```

The current default for `riff_version` is `1.0.0`.

## How it works

With a Rust toolchain (including [Cargo]) and Nix installed in your pipeline,
`install-nix-action` runs the [`install-riff.sh`](./install-riff.sh) script to
install Riff itself.

[cargo]: https://doc.rust-lang.org/cargo
[flakes]: https://nixos.wiki/wiki/Flakes
[nix]: https://nixos.org
[riff]: https://github.com/DeterminateSystems/riff
[rust]: https://rust-lang.org
[toolchain]: https://github.com/actions-rs/toolchain
[install-nix]: https://github.com/cachix/install-nix-action
