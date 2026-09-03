cask "mentu-recipes" do
  version "0.3.2"
  sha256 "93dd98ac3d25c3eb8921a78fdf226851174c2406bbbc787c575b33b461a62204"

  url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-#{version}-macos-arm64.pkg"
  name "Mentu Recipes"
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"

  depends_on arch: :arm64

  pkg "mentu-recipes-#{version}-macos-arm64.pkg"

  uninstall pkgutil: "ai.mentu.recipes"
end
