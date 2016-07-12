class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v0.1.1.tar.gz"
  sha256 "eed21945d9e752b4a95fde427294a8296e97e187502865a74f12deccffd3814f"

  head "https://github.com/anicholson/barnabas.git", revision: "master"

  depends_on "crystal-lang" => :build

  def install
    system "crystal", "deps", "update"
    system "crystal", "build", "src/barnabas.cr"
    bin.install Dir["barnabas"]

    system "mkdir", "-p", "~/.barnabas"
    system "touch", "~/.barnabas/contacts.toml"
  end

  def test
    system "barnabas", "-h"
  end
end
