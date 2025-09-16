require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.45"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.45/9a9b7fa/liblab-v0.49.45-9a9b7fa-darwin-x64.tar.gz"
    sha256 "f946d22b3d7bf6a8b61b611825b62b1f0963582eac245ec593b636c8e1ef2ddc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.45/9a9b7fa/liblab-v0.49.45-9a9b7fa-darwin-arm64.tar.gz"
    sha256 "5d46db519990c6fea8ea713b73cf2c42f6ae621d87434dc95b6d1ec4f381574b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.45/9a9b7fa/liblab-v0.49.45-9a9b7fa-linux-arm.tar.gz"
    sha256 "9fa4d594178922808bac686eecbbf46dc307020e351197c76cd81886ad1511f5"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.45/9a9b7fa/liblab-v0.49.45-9a9b7fa-linux-x64.tar.gz"
    sha256 "592f0237bc0db0090dde1246a044601a51e0e246b2b10756a6ff8b048ba1e0d0"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end