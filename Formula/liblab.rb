require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.15"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.15/6700eb2/liblab-v0.49.15-6700eb2-darwin-x64.tar.gz"
    sha256 "c5bc8da7d4bb323602302f124e319dc83ccb35ebf3cb7bc1d498998f1e991cb9"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.15/6700eb2/liblab-v0.49.15-6700eb2-darwin-arm64.tar.gz"
    sha256 "e7bf5a0dfd529120849bb644034ce6c406474984c8fe45e62022b73e6d5bad36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.15/6700eb2/liblab-v0.49.15-6700eb2-linux-arm.tar.gz"
    sha256 "a637e8ff92ec4e68799e8f9d980dbb70a08f55751bedc1e8356f122a23db23ad"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.15/6700eb2/liblab-v0.49.15-6700eb2-linux-x64.tar.gz"
    sha256 "39b317225f348a9ff7695d3c6af9171e6474c7802802ca6dc4a4e469cfd5d1f2"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end