class Fastrun < Formula
  desc "Fast command launcher with fuzzy search for npm scripts and make targets"
  homepage "https://github.com/katoken03/fastrun"
  
  url "https://github.com/katoken03/fastrun/archive/v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "d4da0c76180a4877b9d939dc92f63f2770ab1785a16b0d688f2b9ace087a7d8a"
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