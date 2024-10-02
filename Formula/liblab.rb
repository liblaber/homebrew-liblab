require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.47.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.0/1890dd2/liblab-v0.47.0-1890dd2-darwin-x64.tar.gz"
    sha256 "e0ffddd1f338f699960a3a7bafaf88804286bef90abe987b2072b93a907c5203"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.0/1890dd2/liblab-v0.47.0-1890dd2-darwin-arm64.tar.gz"
    sha256 "c0a9b2f006773dc75345275addbb46a832316eb3a8c998135e112986d13d74bf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.0/1890dd2/liblab-v0.47.0-1890dd2-linux-arm64.tar.gz"
    sha256 "bcd0450ea06aaf8f997f2d64f2689005e677662cc11488547e204de32c706d33"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.0/1890dd2/liblab-v0.47.0-1890dd2-linux-x64.tar.gz"
    sha256 "3a9fb589f42bdb44accaa3588a86aee227fc87285e8cd6fb0a024af509780c14"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end