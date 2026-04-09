class Mentu < Formula
  desc "Local autonomous execution runtime with on-device intelligence"
  homepage "https://mentu.ai"
  url "https://pub-fc4283f8bcfb400cb3545d60fd6667e0.r2.dev/v0.1.0/mentu-0.1.0-arm64.tar.gz"
  sha256 "bf1b22e811f8fc3bcdb64d26dd390dbfae976d53f9f99ee25f25575d52cba7a5"
  license :cannot_represent

  def install
    bin.install "mentu"
    bin.install "mentud"
    lib.install "libinterceptor_proxy.dylib"
    prefix.install "ai.mentu.plist"
  end

  def post_install
    system "install_name_tool", "-change", "@loader_path/../lib/libinterceptor_proxy.dylib",
           "#{lib}/libinterceptor_proxy.dylib", "#{bin}/mentud"
    system "launchctl", "load", "-w", "#{prefix}/ai.mentu.plist"
  end
end
