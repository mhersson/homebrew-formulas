class Aim < Formula
  desc "Terminal multiplexer for coding agents with live diffs and pull requests"
  homepage "https://github.com/mhersson/aim"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.3/aim_1.0.0-rc.3_darwin_arm64.tar.gz"
      sha256 "8c38671c0659a66f16ff806a0e5ba2b08e147aa5e8bcf074fc9c0555506322d9"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.3/aim_1.0.0-rc.3_darwin_amd64.tar.gz"
      sha256 "5ef3ab3ce42ddea64e0256dd253e4d261f81ac8f167143c0e49c13252ea75e21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.3/aim_1.0.0-rc.3_linux_arm64.tar.gz"
      sha256 "965c19857a9d51f67cc7bbe611b57d90279f415d645cfcf66eb44201bfe95385"
    end
    on_intel do
      url "https://github.com/mhersson/aim/releases/download/v1.0.0-rc.3/aim_1.0.0-rc.3_linux_amd64.tar.gz"
      sha256 "5bb5751c376185a95af863ef8f11e5a4696a7b422f2c6d139c87b52dc62366bc"
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
