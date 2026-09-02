cask "mentu-recipes" do
  version "0.2.2"
  sha256 "8c644b5192f9466e4b414e69e37a4ee33dff55cb723c9f95f7ccd8bc1bb5101a"

  url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-#{version}-macos-arm64.pkg"
  name "Mentu Recipes"
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"

  depends_on arch: :arm64

  pkg "mentu-recipes-#{version}-macos-arm64.pkg"

  uninstall pkgutil: "ai.mentu.recipes"
end
