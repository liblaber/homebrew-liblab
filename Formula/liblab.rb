require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.4"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.4/ce11b06/liblab-v0.38.4-ce11b06-darwin-x64.tar.gz"
    sha256 "fbcbcaa345513d1472ad64503ed15d1fa6e27ee94ac474411777dce093bdb523"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.4/ce11b06/liblab-v0.38.4-ce11b06-darwin-arm64.tar.gz"
    sha256 "3264e702db6f70e8a8e660e52e63d70b4bfced6de0856b0fd51516b2b160b841"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.4/ce11b06/liblab-v0.38.4-ce11b06-linux-arm64.tar.gz"
    sha256 "7a9d7a2403afd625d09e7c70f1155f4e9a19056ff29b2c7ec6d27be3651f1471"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.4/ce11b06/liblab-v0.38.4-ce11b06-linux-x64.tar.gz"
    sha256 "9269f211beda9c0218eb6cac59376276cde00d3dd1d958f5dcdd29b5f42ea85b"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end