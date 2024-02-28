require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.1/1691d5a/liblab-v0.38.1-1691d5a-darwin-x64.tar.gz"
    sha256 "8c2a37f090476c34749c394b782fef51464f3bd1ce978a3bf2a84f54a9ae7ddc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.1/1691d5a/liblab-v0.38.1-1691d5a-darwin-arm64.tar.gz"
    sha256 "73f26636b8b23ce392f2f44a23260555f7f696030788a602289d183413968e14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.1/1691d5a/liblab-v0.38.1-1691d5a-linux-arm64.tar.gz"
    sha256 "fa7ea740039d18ae4b8b416197d25089a01b85e3c6fea869e045ee24561bfae1"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.1/1691d5a/liblab-v0.38.1-1691d5a-linux-x64.tar.gz"
    sha256 "0b33be077e1e4a79b87cfac37a53a9d91febb2fc9f182d962a624ed9fbe9b472"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end