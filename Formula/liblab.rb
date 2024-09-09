require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.43.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.43.0/e0b3ca5/liblab-v0.43.0-e0b3ca5-darwin-x64.tar.gz"
    sha256 "8467c15f7c653c06e6ed9a8868ecbb41a5d947b6700584985e60d864fc0df25f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.43.0/e0b3ca5/liblab-v0.43.0-e0b3ca5-darwin-arm64.tar.gz"
    sha256 "987d97752052a6c55fd10f3d6bf86f24437429c51aedd7f5bfe7394178ebf1a0"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.43.0/e0b3ca5/liblab-v0.43.0-e0b3ca5-linux-arm64.tar.gz"
    sha256 "cebc349d352ffa8a3a508d53db195e0957126a39dc5e7e802abdb8a49497e176"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.43.0/e0b3ca5/liblab-v0.43.0-e0b3ca5-linux-x64.tar.gz"
    sha256 "790320bf761b518c8c726b2cd070823924b0cb0b8eb586e0937bdbcd7fc53c58"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end