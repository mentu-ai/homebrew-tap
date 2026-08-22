class MentuRecipesBin < Formula
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-arm64"
      sha256 "1c3d0cf8c291ee43528d26ea3e7cc3fd5c08658ef2853f0ae306b99968f8fbba"
    end

    on_intel do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-x86_64"
      sha256 "10534355a325cc57d0fba9e38623cac4443ffd29095cc925f5f4aa3f37a11c9d"
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
