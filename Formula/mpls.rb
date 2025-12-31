  class Mpls < Formula
    desc "Markdown Preview Language Server with live browser preview"
    homepage "https://github.com/mhersson/mpls"
    url "https://github.com/mhersson/mpls/archive/refs/tags/v0.16.1.tar.gz"
    sha256 "7157e39b57548b9938e04f950265e041a9de4ed951b7a9a497ff0bcb65c20bc4"
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
