# Mentu Homebrew Tap

## Mentu Recipes

Install the signed, notarized Mentu Recipes package:

```sh
brew install --cask mentu-ai/tap/mentu-recipes
```

Verify the installed binary:

```sh
mentu-recipes adapters
mentu-recipes check shell-smoke
```

## Mentu Runtime

The previous `mentu` formula was removed because its `1.0.0` release artifact
is not publicly reachable. Use the `mentu-recipes` cask until the runtime
artifact is republished behind a stable public URL.
