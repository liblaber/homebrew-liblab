require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.28"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.28/0c98f47/liblab-v0.49.28-0c98f47-darwin-x64.tar.gz"
    sha256 "8d130fc087e781e66eb39f103ca418178c043b53b160a1fbd22c6596c9346e75"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.28/0c98f47/liblab-v0.49.28-0c98f47-darwin-arm64.tar.gz"
    sha256 "c91f7d0b17c13a321ab57252deb1d05e780d45203d8797091a7fb8ce0646a27c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.28/0c98f47/liblab-v0.49.28-0c98f47-linux-arm.tar.gz"
    sha256 "05a8cbc0e3b4bed13587b7855214c1cfe3d80912615275ec08a33ad5edb1c7e7"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.28/0c98f47/liblab-v0.49.28-0c98f47-linux-x64.tar.gz"
    sha256 "f5dc03ab8d82132a30ae13a6b5e87c4c03d7a738a3c43388fe9ae316652943f3"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end