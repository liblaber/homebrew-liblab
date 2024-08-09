require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.2"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.2/0643a74/liblab-v0.41.2-0643a74-darwin-x64.tar.gz"
    sha256 "4dfc71f63bd814c648ed3f626ab18aeecd0bea99eaaba06199803b113d4e4c84"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.2/0643a74/liblab-v0.41.2-0643a74-darwin-arm64.tar.gz"
    sha256 "758cb21e3127ec40fae67f36957c285d096fbda4e55ca87a353003728aaf2622"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.2/0643a74/liblab-v0.41.2-0643a74-linux-arm64.tar.gz"
    sha256 "a66807a7ed28daab02cd54a7a99c20bce6305791794586c0a46ac01eb6c842c9"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.2/0643a74/liblab-v0.41.2-0643a74-linux-x64.tar.gz"
    sha256 "7b60addd8cd899ec68f8d63ed93938a243ea21d2161b141c612d158fcc7438ef"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end