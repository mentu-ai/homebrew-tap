class MentuRecipesBin < Formula
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"
  version "0.2.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-arm64"
      sha256 "dda5297933686788e9b94c22fc43824c5c22a849af77f6e3109c686407466458"
    end

    on_intel do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-x86_64"
      sha256 "dcb0d6d64c2a9795b84695282452571127abf352bc9f11bec3598b409612a714"
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
