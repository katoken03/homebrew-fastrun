class Fastrun < Formula
  desc "Fast command launcher with fuzzy search for npm scripts and make targets"
  homepage "https://github.com/katoken03/fastrun"
  
  url "https://github.com/katoken03/fastrun/archive/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "bb135f5d66ea2468ffe97b476b9c32ee7d4a23b8936a88d0f48a27f3b0a2531b"
  license "MIT"

  depends_on "go" => :build
  depends_on "fzf"

  def install
    system "go", "build", *std_go_args(output: bin/"f")
  end

  def caveats
    <<~EOS
      fastrun has been installed as the command 'f'.
      To use it:
      1. Move to a directory with package.json or Makefile
      2. Just type 'f' and press Enter
         f [Enter]
    EOS
  end

  test do
    assert_match "fastrun version", shell_output("#{bin}/f --version")
  end
end