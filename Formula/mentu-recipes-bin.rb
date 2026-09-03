class MentuRecipesBin < Formula
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"
  version "0.3.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-arm64"
      sha256 "19c0711a42f4560da2458eb396557b20db04e7b04a613cfa02fd93ee775db793"
    end

    on_intel do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-x86_64"
      sha256 "0493cce497407412a6e94039c4cdaa6b40d087f4e39855759ff54a15a9a2d25f"
    end
  end

  conflicts_with cask: "mentu-recipes", because: "both install a mentu-recipes binary"

  def install
    source = Hardware::CPU.arm? ? "mentu-recipes-macos-arm64" : "mentu-recipes-macos-x86_64"
    bin.install source => "mentu-recipes"
  end

  test do
    assert_match "Mentu Recipes", shell_output("#{bin}/mentu-recipes 2>&1")
    assert_match "shell", shell_output("#{bin}/mentu-recipes adapters")
  end
end
