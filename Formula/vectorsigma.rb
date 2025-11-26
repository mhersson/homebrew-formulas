  class Vectorsigma < Formula
    desc "VectorSigma is a tool for generating finite state machines (FSM) in Go from UML diagrams"
    homepage "https://github.com/mhersson/vectorsigma"
    url "https://github.com/mhersson/vectorsigma/archive/refs/tags/v1.2.0.tar.gz"
    sha256 "1018d29416674902e211e8bdf0176cc1eabd364b43e7d45306f10f1bc09897e2"
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
