require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.1/38bd8c9/liblab-v0.41.1-38bd8c9-darwin-x64.tar.gz"
    sha256 "7f96ca65f0922877481bd984205c1f5bd820ca9825a6a0cdaf40abae5130edee"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.1/38bd8c9/liblab-v0.41.1-38bd8c9-darwin-arm64.tar.gz"
    sha256 "41b4913fb506443dd7d516b27fd5242db99516d624cad9079a58152b24b9b168"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.1/38bd8c9/liblab-v0.41.1-38bd8c9-linux-arm64.tar.gz"
    sha256 "d7ff60880669931772271e0411480837589833f72352cab870e340b592c5490f"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.1/38bd8c9/liblab-v0.41.1-38bd8c9-linux-x64.tar.gz"
    sha256 "22120f31c50d1566f666c0c165325bc81030e97fffff1da28259a838979ac8cd"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end