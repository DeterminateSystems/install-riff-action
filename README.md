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
        uses: DeterminateSystems/nix-installer-action@main
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
your pipeline for Riff to work. The [`DeterminateSystems/nix-installer-action`][install-nix]
and [`actions-rs/toolchain`][toolchain] Actions work well for that (and are used
in our [tests](./.github/workflows/test.yml)) but you can use other installation
methods if you wish.

## Available runners

`install-riff-action` is available on `macos-*` and `ubuntu-*` systems. As [Nix]
isn't supported on Windows, `install-riff-action` can't be used on `windows-*`
runners.

## Configuration

You can supply a specific Riff version using the `riff-version` parameter:

```yaml
- name: Install Riff
  uses: DeterminateSystems/install-riff-action@v1
  with:
    riff-version: "1.0.3"
```

The current default for `riff-version` is `1.0.3`.

## How it works

With a Rust toolchain (including [Cargo]) and Nix installed in your pipeline,
`install-riff-action` runs the [`install-riff.sh`](./install-riff.sh) script to
install Riff itself.

## Release process

Releases for this Action are tied to [Riff] releases. For each new Riff version:

* Update `inputs.riff-version.default` in [`action.yml`](./action.yml).
* Update `riff-version` in the [README](./README.md) and in the [CI
  pipeline][ci].
* Pull request the changes and merge.
* Tag the new `HEAD` with the new version (e.g. `v1.2.3`) and push.
* [Create a new release][create] with the following attributes:
  * Select the new version tag.
  * Provide a release title of the form `install-riff-action-v*`, e.g.
    `install-riff-action-v1.2.3`.
  * Choose **Dependency Management** as the primary category.
  * Add a brief release note, e.g. `Release for Riff version v1.2.3`.
  * Submit the release.

[cargo]: https://doc.rust-lang.org/cargo
[ci]: ./.github/workflows/test.yml
[create]: https://github.com/DeterminateSystems/install-riff-action/releases/new
[flakes]: https://nixos.wiki/wiki/Flakes
[nix]: https://nixos.org
[riff]: https://github.com/DeterminateSystems/riff
[rust]: https://rust-lang.org
[toolchain]: https://github.com/actions-rs/toolchain
[install-nix]: https://github.com/DeterminateSystems/nix-installer-action

