require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.32"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.32/b0cb562/liblab-v0.49.32-b0cb562-darwin-x64.tar.gz"
    sha256 "23901b86fd83a1c87173a9e79ee717e2527439dbfee8f73b17d7521c859b0003"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.32/b0cb562/liblab-v0.49.32-b0cb562-darwin-arm64.tar.gz"
    sha256 "2d38fe5cd7f859587a5a6bd2385501b43c6f75d1408e86e15bc4b6ce81fc7ad1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.32/b0cb562/liblab-v0.49.32-b0cb562-linux-arm.tar.gz"
    sha256 "9b7b02e89b2a23cb3062a1a1c467702fa787223a63c8bf6f6c85133e2e571a62"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.32/b0cb562/liblab-v0.49.32-b0cb562-linux-x64.tar.gz"
    sha256 "2c5bc85f152713a82f715309a3282d4617f248564b66b4a986be1c8f31e749d5"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end