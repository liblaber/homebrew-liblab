require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.48.3"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.48.3/44dbf11/liblab-v0.48.3-44dbf11-darwin-x64.tar.gz"
    sha256 "cb7e1cbeeb95477c8858ca087968813957f157b7b00280a84973913195cdc3b1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.48.3/44dbf11/liblab-v0.48.3-44dbf11-darwin-arm64.tar.gz"
    sha256 "0d37979c5480984477a48174e66af6e51c95ea2f81a0a3dadb4d777964730b25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.48.3/44dbf11/liblab-v0.48.3-44dbf11-linux-arm.tar.gz"
    sha256 "a7e6e13b3b3c7920204c3ecf20d35b28cead0ec6a2ecca249f9f9a15616ad300"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.48.3/44dbf11/liblab-v0.48.3-44dbf11-linux-x64.tar.gz"
    sha256 "3564e439df04782f4c16ca43a3cd2c8f14417a7f44356d3cfb3c301e78b6e9bf"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end