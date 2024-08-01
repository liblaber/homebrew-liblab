require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.40.2"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.2/21f8000/liblab-v0.40.2-21f8000-darwin-x64.tar.gz"
    sha256 "4e280f4e18f137b4fa20ace9a13f070c5a054d87fec659d9f3750bf6508a5690"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.2/21f8000/liblab-v0.40.2-21f8000-darwin-arm64.tar.gz"
    sha256 "e64e3bcfaa6db23a1adfae751e5300564e8d534b9e6921cf339ab3aac6e5a580"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.2/21f8000/liblab-v0.40.2-21f8000-linux-arm64.tar.gz"
    sha256 "0058fd9cde4ea724efa64cb5ff0b4393845e15150d3c8cdd0a9e422e411faf76"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.2/21f8000/liblab-v0.40.2-21f8000-linux-x64.tar.gz"
    sha256 "c167c567913d18c73b9a797c0f12a667f9611a1d92f42938889d1fc9392318dc"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end