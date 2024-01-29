require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.36.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.36.0/57cff0b/liblab-v0.36.0-57cff0b-darwin-x64.tar.gz"
    sha256 "8e9fb87077d04cb6f78b69c0ddfed06200eafd11dc093734fd0cf137751bc308"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.36.0/57cff0b/liblab-v0.36.0-57cff0b-darwin-arm64.tar.gz"
    sha256 "70f548f3556ddbee7afed77efd6f1b6db2f13549baff3ce516f19ed0b8f36ead"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.36.0/57cff0b/liblab-v0.36.0-57cff0b-linux-arm64.tar.gz"
    sha256 "ebe7c8bbdf9b7161d060ed64d4612c412884a0a4e9827379ffdef1b23aa07c19"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.36.0/57cff0b/liblab-v0.36.0-57cff0b-linux-x64.tar.gz"
    sha256 "712941984cac1aef66f808e283b3cf33424fba2e10f46ea87bf39f0f543b1f17"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end