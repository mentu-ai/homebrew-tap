class MentuRecipesBin < Formula
  desc "Source-available runner for file-based agent workflows"
  homepage "https://github.com/mentu-ai/mentu-recipes"
  version "0.4.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-arm64"
      sha256 "f3ecf91aca26ca927d922098f3b0061897b5977c622fce84c0b3168bb08f9fb6"
    end

    on_intel do
      url "https://github.com/mentu-ai/mentu-recipes/releases/download/v#{version}/mentu-recipes-macos-x86_64"
      sha256 "d96669a21dbda06ec37dd2b6ab9e95e2298ae934d54ea207f1a2311213397554"
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
