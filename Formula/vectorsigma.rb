  class Vectorsigma < Formula
    desc "VectorSigma is a tool for generating finite state machines (FSM) in Go from UML diagrams"
    homepage "https://github.com/mhersson/vectorsigma"
    url "https://github.com/mhersson/vectorsigma/archive/refs/tags/v1.1.0.tar.gz"
    sha256 "b150531202a2d142b80ddc216d0e6c99d181d8d3d967c13904fc1226256d3dc0"
    license "MIT"
    head "https://github.com/mhersson/vectorsigma.git", branch: "main"

    depends_on "go" => :build

    def install
      ldflags = %W[
        -s -w
        -X github.com/mhersson/vectorsigma/cmd.Version=#{version}
      ]
      system "go", "build", *std_go_args(ldflags: ldflags)
    end

    test do
      assert_match version.to_s, shell_output("#{bin}/vectorsigma --version")
    end
  end
