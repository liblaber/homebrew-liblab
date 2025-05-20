require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.31"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.31/fbaef78/liblab-v0.49.31-fbaef78-darwin-x64.tar.gz"
    sha256 "21cad399af352e63cdfb8df67005d2f876ca1348fc12e2c0561986a0eae6c44d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.31/fbaef78/liblab-v0.49.31-fbaef78-darwin-arm64.tar.gz"
    sha256 "c147c6df61f42d595585cff9905f052a5b0b5a90c98c37c88df358f77e0f36b9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.31/fbaef78/liblab-v0.49.31-fbaef78-linux-arm.tar.gz"
    sha256 "0adf4c16932c78af7a20c4848de046fbd67c514e708ed6c2353601d9c243c556"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.31/fbaef78/liblab-v0.49.31-fbaef78-linux-x64.tar.gz"
    sha256 "d3d58a68bd602b86787c690a380d99d6fdde6442813a0160236440b6f10b766e"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end