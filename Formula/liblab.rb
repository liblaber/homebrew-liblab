require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.1/919eee8/liblab-v0.39.1-919eee8-darwin-x64.tar.gz"
    sha256 "6103f710d3850f62d8b7e0ffe991aaa79190823029c6fe6f266a9ae6ed394bb4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.1/919eee8/liblab-v0.39.1-919eee8-darwin-arm64.tar.gz"
    sha256 "89f1f325eccf2ebbea38042a154af6b5d3109b3b8433bbb25c2cbacc3805293a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.1/919eee8/liblab-v0.39.1-919eee8-linux-arm64.tar.gz"
    sha256 "a2535cd9a1fa8e386b557eaabe8160d8fd71b5829a88242ee9bb04db0a7d2280"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.1/919eee8/liblab-v0.39.1-919eee8-linux-x64.tar.gz"
    sha256 "106576df8745f54114feeaa5008f5cf225eb898a0b1b02731eb7402e5a8dff58"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end