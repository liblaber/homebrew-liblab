require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.7"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.7/fcbfae0/liblab-v0.39.7-fcbfae0-darwin-x64.tar.gz"
    sha256 "61c3425e54b92d07049637e96f97aa93b22874229218820008e992d41bd196a0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.7/fcbfae0/liblab-v0.39.7-fcbfae0-darwin-arm64.tar.gz"
    sha256 "ef7e35a7b034a31b11377b30b29a07f12716e495592e11aea6beab5924ae90eb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.7/fcbfae0/liblab-v0.39.7-fcbfae0-linux-arm64.tar.gz"
    sha256 "8ff6cc6966f407bc14214eecdb623943694aa07ac7d1d30cf14bffdc1602a415"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.7/fcbfae0/liblab-v0.39.7-fcbfae0-linux-x64.tar.gz"
    sha256 "e29e23957c2df44965035b8d6369ca6d0482e87ad4338a72ecd4e45a94e25b7e"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end