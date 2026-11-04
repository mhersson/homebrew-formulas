class Aim < Formula
  desc "Terminal multiplexer for coding agents with live diffs and pull requests"
  homepage "https://github.com/mhersson/aim"
  version "1.0.0-rc.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.1/aim_1.0.0-rc.1_darwin_arm64.tar.gz"
      sha256 "cc1883d1ba517910410bd0f483f5555b3109eb07aad5b7f9d62e8ad6470b649e"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.1/aim_1.0.0-rc.1_darwin_amd64.tar.gz"
      sha256 "46ed7e08b65584263e8fe798f26aa557da5d110b52de369431db7d147dee6275"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.1/aim_1.0.0-rc.1_linux_arm64.tar.gz"
      sha256 "246ec8a77b9c2fe95e1a377a0c868c7f7f065b0750ba3ca3e9e9a12bd8b5c5e3"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.1/aim_1.0.0-rc.1_linux_amd64.tar.gz"
      sha256 "516fc39a60b39503e8fddb364dbd1e123a35cc463b91133826b1cfe4231fa367"
    end
  end

  def install
    bin.install "aim"
    pkgshare.install "config.example.toml"
    doc.install "THIRD_PARTY.md"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aim --version")
  end
end
