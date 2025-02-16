class Fastrun < Formula
  desc "Fast command launcher with fuzzy search for npm scripts and make targets"
  homepage "https://github.com/katoken03/fastrun"
  
  url "https://github.com/katoken03/fastrun/archive/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "511dc2ad82534057d5b535bd0c806545faceef6385cd479ece573a173af30601"
  license "MIT"

  depends_on "go" => :build
  depends_on "fzf"

  def install
    system "go", "build", *std_go_args(output: bin/"f")
  end

  def caveats
    <<~EOS
      ✅ fastrun has been installed as the command 'f'.
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