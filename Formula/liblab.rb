require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.24"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.24/1adfaf9/liblab-v0.49.24-1adfaf9-darwin-x64.tar.gz"
    sha256 "eeb37a85c47c623cd6a6168a159c052f51d75c942b8e06bd2bfe3d636fbc2a34"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.24/1adfaf9/liblab-v0.49.24-1adfaf9-darwin-arm64.tar.gz"
    sha256 "31b7cae283ad19bb9d16722f8d30ca13b99c8d3350a01b1161d05808c8e1dc3e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.24/1adfaf9/liblab-v0.49.24-1adfaf9-linux-arm.tar.gz"
    sha256 "409d055c91a7b288092349b997f72f752c22b0d2ea6af4ebbb38a9eacac79155"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.24/1adfaf9/liblab-v0.49.24-1adfaf9-linux-x64.tar.gz"
    sha256 "356d423f32d2e749bad2959ebc06e3264de7d231e541c971c791092cdd3a0cb2"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end