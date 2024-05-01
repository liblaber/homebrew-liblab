require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.2"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.2/cc7651e/liblab-v0.39.2-cc7651e-darwin-x64.tar.gz"
    sha256 "83698354bfaebd1e6236a817389fa56f60aa0ac2fb24232ae34320494df21899"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.2/cc7651e/liblab-v0.39.2-cc7651e-darwin-arm64.tar.gz"
    sha256 "2627acf82dd46edc89f21e4be2986469187cc06b272eddab9bc722f21db0500f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.2/cc7651e/liblab-v0.39.2-cc7651e-linux-arm64.tar.gz"
    sha256 "ec3fb4924ce6bc6af2422c313577576bbc93e12acee8ceffebd71a034cc0bb00"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.2/cc7651e/liblab-v0.39.2-cc7651e-linux-x64.tar.gz"
    sha256 "59408df6d6849104e55f10a528b0f7c8ac49e03eb569b60feffda1b02b12d2d0"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end