class MentuRecipesBin < Formula
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"
  version "0.3.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-arm64"
      sha256 "db71fbe9ad5be616dc5c2b36576055e22099f5e7a189c86b429dc203d90a66cc"
    end

    on_intel do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-x86_64"
      sha256 "04cdf178eb28db2dac9ad32acb159154ede56d75ac93251433efb5f1e461eb2e"
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
