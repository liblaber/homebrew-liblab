require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.25"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.25/935c4da/liblab-v0.49.25-935c4da-darwin-x64.tar.gz"
    sha256 "4b5ed60967a2fbe1a94141c926e137a6a4eb231ba55dab8adb38599531ba9379"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.25/935c4da/liblab-v0.49.25-935c4da-darwin-arm64.tar.gz"
    sha256 "706f9ce6e7f281a6b35cd305422d90475d21b99a342dc4d8e76a6662975cb100"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.25/935c4da/liblab-v0.49.25-935c4da-linux-arm.tar.gz"
    sha256 "ad76b4a62ae5e99cd33949d3ab593651d711fc9d06fb9fad04ab9d6b90175c7a"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.25/935c4da/liblab-v0.49.25-935c4da-linux-x64.tar.gz"
    sha256 "7df3496a8a7e7920b27584f65d1d8e33263d62e85f88e2ecc12bb1cb54965d10"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end