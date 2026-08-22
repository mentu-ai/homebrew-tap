# Mentu Homebrew Tap

The Homebrew tap for [Mentu](https://mentu.ai). It is the macOS install channel for Mentu tools that
ship as native binaries. There is no code here beyond formula definitions.

The tap currently carries one product, [Mentu Recipes](https://github.com/mentu-ai/mentu-recipes), a
runner for file-based agent workflows. Install it if you want `mentu-recipes` on your PATH without
building from source.

```sh
brew install mentu-ai/tap/mentu-recipes-bin
```

Everything below is the detail behind that one line.

## Mentu Recipes (formula, recommended)

Install the CI-built binary with published provenance attestation:

```sh
brew install mentu-ai/tap/mentu-recipes-bin
```

The binary is built by GitHub Actions from the tagged source, and every
release asset carries a build provenance attestation. Verify it yourself:

```sh
gh attestation verify "$(brew --prefix)/bin/mentu-recipes" --repo mentu-ai/mentu-recipes
```

The full verification transcript lives in the source repository at
[VERIFICATION.md](https://github.com/mentu-ai/mentu-recipes/blob/main/VERIFICATION.md).

Smoke-test the install:

```sh
mentu-recipes            # prints usage
mentu-recipes adapters   # lists backends and their availability
```

Those two are what `brew test mentu-ai/tap/mentu-recipes-bin` runs. To check or run an actual recipe
you need a recipe file. `mentu-recipes init` creates an empty `.mentu/recipes` in the current
directory; the bundled example recipes live in the
[mentu-recipes repository](https://github.com/mentu-ai/mentu-recipes), not in the formula.

## Mentu Recipes (cask, legacy)

The `0.1.0` signed package remains installable as a cask:

```sh
brew install --cask mentu-ai/tap/mentu-recipes
```

The formula and the cask install the same binary name and conflict with
each other; pick one.

## Mentu Runtime

The previous `mentu` formula was removed because its `1.0.0` release artifact
is not publicly reachable. Use the `mentu-recipes-bin` formula until the
runtime artifact is republished behind a stable public URL.
