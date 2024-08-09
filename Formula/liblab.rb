require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.3"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.3/20a8d65/liblab-v0.41.3-20a8d65-darwin-x64.tar.gz"
    sha256 "47f0d29acdf00afe0b6531815ff9de158544bd9a99b5c7d8381db4aeae15ace3"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.3/20a8d65/liblab-v0.41.3-20a8d65-darwin-arm64.tar.gz"
    sha256 "ad6b91398de0f7de7d0f24b4941e79c21e8f9877ca3a2a9acc7d3ba85aa8f91b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.3/20a8d65/liblab-v0.41.3-20a8d65-linux-arm64.tar.gz"
    sha256 "fc974453acef83c6675257eeba560ffc0c71ad9a12a17cee7209586f38a9966e"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.3/20a8d65/liblab-v0.41.3-20a8d65-linux-x64.tar.gz"
    sha256 "4e02ba86b65b0d96193ea4abca420c09a978ddaa9f49b68ececd05f3e097d04e"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end