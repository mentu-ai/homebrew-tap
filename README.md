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

The `mentu` formula remains in this tap, but its release artifact must be
publicly reachable before new installs will succeed.
