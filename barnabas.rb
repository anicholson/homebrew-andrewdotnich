class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v0.2.0.tar.gz"
  sha256 "1894f557e8cad55eda3b0e46ecf3e173eb358b9af8242bff462f1817547b1a8e"

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
