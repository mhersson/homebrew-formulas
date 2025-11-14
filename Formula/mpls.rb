  class Mpls < Formula
    desc "Markdown Preview Language Server with live browser preview"
    homepage "https://github.com/mhersson/mpls"
    url "https://github.com/mhersson/mpls/archive/refs/tags/v0.16.0.tar.gz"
    sha256 "0e0e30a0822c38e21b5982a279f3067ff0faff28deb7be4ffc5e98ae1e26a961"
    license "Apache-2.0"
    head "https://github.com/mhersson/mpls.git", branch: "main"

    depends_on "go" => :build

    def install
      ldflags = %W[
        -s -w
        -X github.com/mhersson/mpls/cmd.Version=#{version}
        -X github.com/mhersson/mpls/internal/mpls.Version=#{version}
      ]
      system "go", "build", *std_go_args(ldflags: ldflags)
    end

    test do
      assert_match version.to_s, shell_output("#{bin}/mpls --version")
    end
  end
