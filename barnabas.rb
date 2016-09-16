class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v0.3.1.tar.gz"
  sha256 "c1e032ebee3365b908d2df35b52f88f0c58c54fe9b82b642fe01fdfa46ebf8ec"

  head "https://github.com/anicholson/barnabas.git", revision: "master"

  depends_on "crystal-lang" => :build

  def install
    system "crystal", "deps", "update"
    system "crystal", "build", "src/barnabas.cr"
    bin.install Dir["barnabas"]

    system "mkdir", "-p", "~/.barnabas"
    system "crystal", "src/setup.cr"
  end

  def test
    system "barnabas", "-h"
  end
end
