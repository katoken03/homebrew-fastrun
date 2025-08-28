class Fastrun < Formula
  desc "Command launcher tool for developers"
  homepage "https://github.com/katoken03/fastrun"
  url "https://github.com/katoken03/fastrun/archive/v0.4.0.tar.gz"
  sha256 "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"f")
  end

  test do
    system "#{bin}/f --version"
  end
end
