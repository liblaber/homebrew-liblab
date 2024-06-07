require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.5"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.5/1c7b88d/liblab-v0.39.5-1c7b88d-darwin-x64.tar.gz"
    sha256 "47259e5f8493e7ec375a64e8162af664c2a8e3b1f4b0b334175feedc3a84c7ff"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.5/1c7b88d/liblab-v0.39.5-1c7b88d-darwin-arm64.tar.gz"
    sha256 "c22277aa594918597b8e2579f185ac6733a35801e86f60b0f4208ed6ae0c034c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.5/1c7b88d/liblab-v0.39.5-1c7b88d-linux-arm64.tar.gz"
    sha256 "db2a35ee509a97c90470045d2a0bb12b3563a2b12b19b4d5737806bfb0d988ff"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.5/1c7b88d/liblab-v0.39.5-1c7b88d-linux-x64.tar.gz"
    sha256 "425f79e5f3160edf5fe50db0d7d1e8cab5ad07fa58cf822e2d738c256922ed74"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end