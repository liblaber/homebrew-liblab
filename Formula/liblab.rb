require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.26"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.26/4f61db4/liblab-v0.49.26-4f61db4-darwin-x64.tar.gz"
    sha256 "1c62f908d7c5fafc6076e41d4a569bee6552f9698803c6b1dc14ea09bf554c32"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.26/4f61db4/liblab-v0.49.26-4f61db4-darwin-arm64.tar.gz"
    sha256 "ce3d1de52c45739fd8375bd283f78d55b92bd5330c0aceb788d6b728af5540f1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.26/4f61db4/liblab-v0.49.26-4f61db4-linux-arm.tar.gz"
    sha256 "a8838aa20ee870ecb9c5da610d554be446b5b3f560a5a8b9fbf56e29df8625fd"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.26/4f61db4/liblab-v0.49.26-4f61db4-linux-x64.tar.gz"
    sha256 "b9b3788ec80151c0002e15ed0e1e07c0230875910839aaae16ae0bfb56e63a06"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end