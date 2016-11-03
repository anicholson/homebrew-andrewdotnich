class Barnabas < Formula
  desc "Encourage your friends from your terminal"
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v1.0.0-rc.4.tar.gz"
  sha256 "9eec74defa3793a6eff8abc57d226c05d911325b1634c727cf47f82fd60a2956"
  head "https://github.com/anicholson/barnabas.git", :revision => "master", :using => :git

  depends_on "crystal-lang" => :run
  depends_on "sqlite" => :run

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
