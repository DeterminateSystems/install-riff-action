# install-riff-action

This GitHub Action installs [Riff] in your CI pipeline. Riff is a tool that
automatically provides external dependencies for software projects. It currently
works with [Rust] projects but additional language support will be added soon.

```yaml
jobs:
  build-release:
    runs-on: ubuntu-latest
    steps:
      - name: Install Riff
        uses: DeterminateSystems/install-riff-action@v1
      - name: Build release
        run: riff run cargo build -- --release
```

## Pipeline

`install-riff-action` runs two preparatory Actions:

- The [`actions-rs/toolchain@v1`][toolchain] Action installs Rust, specifically
  the most recent `stable` toolchain.
- The [`cachix/install-nix-action@v17`][install-nix] Action installs Nix (with
  [flakes] enabled)

With a Rust toolchain (including Cargo) and Nix installed, `install-nix-action`
runs the [`install-riff.sh`](./install-riff.sh) script to install Riff itself.

[flakes]: https://nixos.wiki/wiki/Flakes
[riff]: https://github.com/DeterminateSystems/riff
[rust]: https://rust-lang.org
[toolchain]: https://github.com/actions-rs/toolchain
[install-nix]: https://github.com/cachix/install-nix-action
