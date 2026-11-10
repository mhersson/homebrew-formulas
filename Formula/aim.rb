class Aim < Formula
  desc "Terminal multiplexer for coding agents with live diffs and pull requests"
  homepage "https://github.com/mhersson/aim"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0/aim_1.0.0_darwin_arm64.tar.gz"
      sha256 "48635395a4bb8668e92053ee32eaff967ff65174361f4a69dcc2edab8cb1076c"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0/aim_1.0.0_darwin_amd64.tar.gz"
      sha256 "fcd7e6f7fc4694530b3ce0c3a1deec1082d68bc2d2dd5e883488f15b65b902c3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0/aim_1.0.0_linux_arm64.tar.gz"
      sha256 "c03f16dfd9b81fbf59e1ddf29227dd64dc19bdc92c2fbaacef25cd07b59f0084"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0/aim_1.0.0_linux_amd64.tar.gz"
      sha256 "5a758583d421a03ebe34173952689e4a646603ea9e4930a4dfa39f754c2bb1cc"
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
