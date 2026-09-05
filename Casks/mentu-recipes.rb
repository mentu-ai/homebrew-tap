cask "mentu-recipes" do
  version "0.4.1"
  sha256 "10e16daa94198a5d8f08355472030697b502cdb025b8db9d7ac82fb0239ca92c"

  url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-#{version}-macos-arm64.pkg"
  name "Mentu Recipes"
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"

  depends_on arch: :arm64

  pkg "mentu-recipes-#{version}-macos-arm64.pkg"

  uninstall pkgutil: "ai.mentu.recipes"
end
