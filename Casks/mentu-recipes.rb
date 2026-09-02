cask "mentu-recipes" do
  version "0.3.0"
  sha256 "9f07c9238b48834ab6036fa6324408a52f6aabc5a2fba5516d1c6160c61e5972"

  url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-#{version}-macos-arm64.pkg"
  name "Mentu Recipes"
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"

  depends_on arch: :arm64

  pkg "mentu-recipes-#{version}-macos-arm64.pkg"

  uninstall pkgutil: "ai.mentu.recipes"
end
