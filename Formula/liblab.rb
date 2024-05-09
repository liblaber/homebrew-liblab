require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.3"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.3/be83c60/liblab-v0.39.3-be83c60-darwin-x64.tar.gz"
    sha256 "1f5301e8b12a439167a1d7a698330fdaab6392bbbaa2360c4f3f3322b5a20fe6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.3/be83c60/liblab-v0.39.3-be83c60-darwin-arm64.tar.gz"
    sha256 "d0d3157af57adebd1f89488cf897f81816daf35cc5d1823535f187d5a73d5286"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.3/be83c60/liblab-v0.39.3-be83c60-linux-arm64.tar.gz"
    sha256 "3be2ef23e1db2936628101731b5a86d46c9dedc5c77eb766cd60d3917418d27c"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.3/be83c60/liblab-v0.39.3-be83c60-linux-x64.tar.gz"
    sha256 "d1712a96594c2358ba8029f483148c7a3449ad858c97969e403539692a1670b1"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end