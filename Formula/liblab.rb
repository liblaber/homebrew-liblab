require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.5"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.5/d135883/liblab-v0.38.5-d135883-darwin-x64.tar.gz"
    sha256 "7481445ec0ddac4728d4a4922599abe0e3e2344fa150f4c2bb2b6600d2b30d0b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.5/d135883/liblab-v0.38.5-d135883-darwin-arm64.tar.gz"
    sha256 "6faaf14a4e5aa4dd560d990d4ae0139ff4bcc85a9864dbcac2683ebe6f3dd4a1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.5/d135883/liblab-v0.38.5-d135883-linux-arm64.tar.gz"
    sha256 "27b43a32b406d228b09def1ee2a3b079c35adfec3ba9dd3ab8c05fa618e154f1"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.5/d135883/liblab-v0.38.5-d135883-linux-x64.tar.gz"
    sha256 "1b9bd84948fa10377be05fb1d85622cfe2af80bdac77784da886a5f34584e4a5"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end