class Barnabas < Formula
  desc "Encourage your friends from your terminal"
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v1.0.0-rc.5.tar.gz"
  sha256 "c571f809c24101ba22a875f3d824b3206990bcb01cdf2764b3e5bf2bc53ef4c0"
  head "https://github.com/anicholson/barnabas.git", :revision => "master", :using => :git

  depends_on "crystal-lang"
  depends_on "sqlite"

  def install
    system "crystal", "deps", "update"
    system "crystal", "build", "src/barnabas.cr"
    bin.install "barnabas"
    share.install "script/suggest.bash", "script/suggest.zsh"

    oh1 "Installation complete!"

    ohai "Run 'barnabas setup' to get started"

    oh1 "Shell integration"

    ohai " If you use bash for your shell, add"
    ohai "source #{share}/suggest.bash"
    ohai "to your .bashrc file."

    ohai "If you use ZSH instead, add"

    ohai "source #{share}/suggest.zsh"
    ohai "to your .zshrc file."
  end

  test do
    system "#{bin}/barnabas", "-h"
  end
end
