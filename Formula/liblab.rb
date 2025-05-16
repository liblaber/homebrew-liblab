require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.30"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.30/7e38fe4/liblab-v0.49.30-7e38fe4-darwin-x64.tar.gz"
    sha256 "d582aa7ae55cabf6d097dab75b0d04070ba4f086860f7ab6a40eb410c99e63df"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.30/7e38fe4/liblab-v0.49.30-7e38fe4-darwin-arm64.tar.gz"
    sha256 "c60be3528d700bba5cc15ffb2c521ed2b1cb60e7c0e0e3ed6ceb9fefda4e12d5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.30/7e38fe4/liblab-v0.49.30-7e38fe4-linux-arm.tar.gz"
    sha256 "9642cb0e4fa538d005426698f6353cc40a04d467e487b0029fdfa6a96bde1f99"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.30/7e38fe4/liblab-v0.49.30-7e38fe4-linux-x64.tar.gz"
    sha256 "97272e5fa60d743c7a32f02a6ddd6292ff7eadb04f0ce31dc3aa352d6e961c78"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end