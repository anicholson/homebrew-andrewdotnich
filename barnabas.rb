class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v0.4.0.tar.gz"
  sha256 "afc1a9ec1b8283a6c3600a3e09b36cf260c24bd2191be34ef18cac2b9c450aa6"

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
