class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v1.0.0-rc.1.tar.gz"
  sha256 "fd81a69abeda35f749b9855e13b07edb9d2f23695a7016b33387073226316c6c"
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
