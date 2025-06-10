require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.40"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.40/28bc87a/liblab-v0.49.40-28bc87a-darwin-x64.tar.gz"
    sha256 "7ba7cc0254c4dbdf70b2f1575508b1a6300671ef803fb39104814fe62b6490cd"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.40/28bc87a/liblab-v0.49.40-28bc87a-darwin-arm64.tar.gz"
    sha256 "c8bc1f2b088a52473ea54d7a9288395264ffac6baf30c83f010664d11e18823a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.40/28bc87a/liblab-v0.49.40-28bc87a-linux-arm.tar.gz"
    sha256 "8133f8046734a38a9e22d5b9afd9029f852e41d66d8cf3feeb6bbfa430cffd42"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.40/28bc87a/liblab-v0.49.40-28bc87a-linux-x64.tar.gz"
    sha256 "5a494e47c087b876e85385161ec2058770d833490fe5c0ccc91bc9d2e1b15dce"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end