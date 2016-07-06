class Barnabas < Formula
  homepage "https://github.com/anicholson/barnabas"
  url "https://github.com/anicholson/barnabas/archive/v0.1.0.tar.gz"
  sha256 "28a20a856b506acd325ebe54f2d220c8f7afd6474ac3db1ab4550b8a8ccd6b98"

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
