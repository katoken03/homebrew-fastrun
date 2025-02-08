class Fastrun < Formula
  desc "Command launcher tool for developers"
  homepage "https://github.com/katoken03/fastrun"
  
  url "https://github.com/katoken03/fastrun/archive/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "実際のshasum値が入ります"
  license "MIT"

  depends_on "go" => :build
  depends_on "fzf"

  def install
    system "go", "build", *std_go_args(output: bin/"f")
  end

  test do
    assert_match "fastrun version", shell_output("#{bin}/f --version")
  end
end