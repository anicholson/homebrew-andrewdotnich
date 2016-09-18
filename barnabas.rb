class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v0.4.0.tar.gz"
  sha256 "a21a9aed505485fe97dfe510582be0d7935c541f929b6181b265998533c8245c"

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
