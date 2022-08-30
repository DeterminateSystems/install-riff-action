# Install Riff

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
