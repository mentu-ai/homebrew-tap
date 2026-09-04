cask "mentu-recipes" do
  version "0.4.0"
  sha256 "2db9283270fd061941acf1f447eb56b238c7fab7a27c19013b91de52c23eb716"

  url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-#{version}-macos-arm64.pkg"
  name "Mentu Recipes"
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"

  depends_on arch: :arm64

  pkg "mentu-recipes-#{version}-macos-arm64.pkg"

  uninstall pkgutil: "ai.mentu.recipes"
end
