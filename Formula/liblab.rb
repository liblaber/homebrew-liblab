require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.19"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/7ba2dee/liblab-v0.49.19-7ba2dee-darwin-x64.tar.gz"
    sha256 "4f7fc06101ebfdb0d25d225f960b38ae46462a1cb5e822464902fcaa3406f02f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/7ba2dee/liblab-v0.49.19-7ba2dee-darwin-arm64.tar.gz"
    sha256 "0c6033c6e898a4669d7820b03d84d6de03e3c42e0126f18ab33e7f0d426f4fca"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/7ba2dee/liblab-v0.49.19-7ba2dee-linux-arm.tar.gz"
    sha256 "cf4af7ec89db61dbde6f5d620016661ea9473ed78e81b0e22f3ce0cc4f4b03b0"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/7ba2dee/liblab-v0.49.19-7ba2dee-linux-x64.tar.gz"
    sha256 "8e07f9dcccf13d0b52f8a090bee07b346ad71b5b29347d51f8bbb07d3fd981bf"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end