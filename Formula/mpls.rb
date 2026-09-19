  class Mpls < Formula
    desc "Markdown Preview Language Server with live browser preview"
    homepage "https://github.com/mhersson/mpls"
    url "https://github.com/mhersson/mpls/archive/refs/tags/v0.23.0.tar.gz"
    sha256 "78c7c6290813378783df1c227b1c9c540be1ae75c55c20cb680da87f88252cb5"
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
