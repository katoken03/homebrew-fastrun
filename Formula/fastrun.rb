class Fastrun < Formula
  desc "Fast command launcher with fuzzy search for npm scripts and make targets"
  homepage "https://github.com/katoken03/fastrun"
  
  url "https://github.com/katoken03/fastrun/archive/v0.3.1.tar.gz"
  version "0.3.1"
  sha256 "9fb9ff5988b2494d0833f5c8cf03ebb25f573e13605d7bb60bbd7c056a0135ef"
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

      For proper shell history integration, run:
         f generate-shell-function --shell=bash  # For bash users
         f generate-shell-function --shell=zsh   # For zsh users
      And follow the instructions to add the function to your shell config.
    EOS
  end

  test do
    assert_match "fastrun version", shell_output("#{bin}/f --version")
  end
end