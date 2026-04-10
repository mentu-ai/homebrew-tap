class Mentu < Formula
  desc "Local autonomous execution runtime with on-device intelligence"
  homepage "https://mentu.ai"
  url "https://pub-fc4283f8bcfb400cb3545d60fd6667e0.r2.dev/v1.0.0/mentu-1.0.0-arm64.tar.gz"
  sha256 "7c566ba5e466b4d9dc090a161e5b6a06553b8dff1fb82320ec0aff47226436b4"
  license :cannot_represent

  def install
    bin.install "mentu"
    bin.install "mentud"
    bin.install "mentud-toolbar"
    lib.install "libinterceptor_proxy.dylib"
    prefix.install "ai.mentu.plist"
    prefix.install "SHA256SUMS"
  end

  def post_install
    system "install_name_tool", "-change", "@loader_path/../lib/libinterceptor_proxy.dylib",
           "#{lib}/libinterceptor_proxy.dylib", "#{bin}/mentud"
    system "launchctl", "load", "-w", "#{prefix}/ai.mentu.plist"
  end
end
