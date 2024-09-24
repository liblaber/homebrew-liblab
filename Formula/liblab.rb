require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.45.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.45.0/d8b62b1/liblab-v0.45.0-d8b62b1-darwin-x64.tar.gz"
    sha256 "d1611f758f88fdaf06ad5bde69c276ea3daba1bf9554a52ce078301a1a0cd1e6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.45.0/d8b62b1/liblab-v0.45.0-d8b62b1-darwin-arm64.tar.gz"
    sha256 "c41ca0fee33ff0119a9cda7ea36a9c9bcbfab6451152cebb270484a5cc8a08d6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.45.0/d8b62b1/liblab-v0.45.0-d8b62b1-linux-arm64.tar.gz"
    sha256 "61302051c9ddc493d3dc5fc9fe4bebba9e2cec5cf6509ce6fd1963bb7657268a"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.45.0/d8b62b1/liblab-v0.45.0-d8b62b1-linux-x64.tar.gz"
    sha256 "a225001da8ed6ea0d409b5e97e66ef5ad63709b6463e44f3e7c7bd26c1d8f5f5"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end