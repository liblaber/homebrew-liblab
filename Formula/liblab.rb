require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.20"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.20/f9bfa34/liblab-v0.49.20-f9bfa34-darwin-x64.tar.gz"
    sha256 "6b820e481434a537394c321faccbcfc05cc924e7ea73e9638caf55e18b1a09e5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.20/f9bfa34/liblab-v0.49.20-f9bfa34-darwin-arm64.tar.gz"
    sha256 "44ac5b79778ddaab10a7504c9d2bd26d3e2eb74e1132e2c528ed75212ad92e38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.20/f9bfa34/liblab-v0.49.20-f9bfa34-linux-arm.tar.gz"
    sha256 "3bc4c4d977cc3a2a4591e3ddc07ab1865def3ca3e973c410eae55ac47644a6ee"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.20/f9bfa34/liblab-v0.49.20-f9bfa34-linux-x64.tar.gz"
    sha256 "3ed89acd4761a2d14c3264c1b2993ed5c88d11efd1d0ccf001f5fc6df5357ae7"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end