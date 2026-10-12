  class Helix < Formula
    desc "Post-modern modal text editor (fork with in-buffer Markdown rendering)"
    homepage "https://github.com/mhersson/helix"
    url "https://github.com/mhersson/helix/releases/download/v2026.10.1/helix-v2026.10.1-source.tar.xz"
    sha256 "d43f5b340aa287b776023767f1e1ed2fa16f96e476535b8e9d2cf0ca1c816fcb"
    license "MPL-2.0"
    head "https://github.com/mhersson/helix.git", branch: "main"

    depends_on "rust" => :build

    conflicts_with "evil-helix", because: "both install `hx` binary"
    conflicts_with "hex", because: "both install `hx` binary"

    def install
      ENV["HELIX_DEFAULT_RUNTIME"] = libexec/"runtime"
      system "cargo", "install", *std_cargo_args(path: "helix-term")
      rm_r "runtime/grammars/sources"
      libexec.install "runtime"

      bash_completion.install "contrib/completion/hx.bash" => "hx"
      fish_completion.install "contrib/completion/hx.fish"
      zsh_completion.install "contrib/completion/hx.zsh" => "_hx"
    end

    test do
      assert_match version.to_s, shell_output("#{bin}/hx --version")
      assert_match(/Tree-sitter parser: .*✓/, shell_output("#{bin}/hx --health markdown"))
    end
  end
