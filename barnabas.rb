class Barnabas < Formula
  desc "Encourage your friends from your terminal"
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v1.0.0-rc.1.tar.gz"
  sha256 "fd81a69abeda35f749b9855e13b07edb9d2f23695a7016b33387073226316c6c"
  head "https://github.com/anicholson/barnabas.git", :revision => "master", :using => :git

  depends_on "crystal-lang" => :run

  def install
    system "crystal", "deps", "update"
    system "crystal", "build", "src/barnabas.cr"
    bin.install "barnabas"
    share.install "script/suggest.bash", "script/suggest.zsh"

    mkdir_p  "~/.barnabas"
    system "crystal", "src/setup.cr"

    oh1 "Installation complete!"
    ohai " If you use bash for your shell, add"
    ohai "source #{share}/suggest.bash"
    ohai "to your .bashrc file."

    ohai "If you use ZSH instead, add"

    ohai "source #{share}/suggest.zsh"
    ohai "to your .zshrc file."
  end

  test do
    system "barnabas", "-h"
  end
end
