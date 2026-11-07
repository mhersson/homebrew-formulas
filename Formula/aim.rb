class Aim < Formula
  desc "Terminal multiplexer for coding agents with live diffs and pull requests"
  homepage "https://github.com/mhersson/aim"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.2/aim_1.0.0-rc.2_darwin_arm64.tar.gz"
      sha256 "5abe50291874135c4f19e9cb4505602116dc6ff2e580603270e88db1a2773e85"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.2/aim_1.0.0-rc.2_darwin_amd64.tar.gz"
      sha256 "453e6054f4a8b47c20a9f89395c9483849d4d3e6e5768b9e1c85db869eede328"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.2/aim_1.0.0-rc.2_linux_arm64.tar.gz"
      sha256 "eb1724cc7d9d4fd5acd1507850304a283853488bcd50b5307bd30d54a10a6680"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.2/aim_1.0.0-rc.2_linux_amd64.tar.gz"
      sha256 "28ec669568ef2a429bbbc03948b58799b49850eea00853f1f7840f33eaa28457"
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
