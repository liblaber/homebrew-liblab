require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.6"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.6/701320d/liblab-v0.38.6-701320d-darwin-x64.tar.gz"
    sha256 "06b9a1bc8d2f5f041ce9e9408093ab5356bfbaf2e5226dbdb87ffbc875763391"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.6/701320d/liblab-v0.38.6-701320d-darwin-arm64.tar.gz"
    sha256 "15fe8f3d1bfceeadade6718957fa1563b8633befe52ba61b2d440f93de6035fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.6/701320d/liblab-v0.38.6-701320d-linux-arm64.tar.gz"
    sha256 "6a692b8ecd172d0def1164935256dd1fa2370df44aa2f6a9c1db34f90f1c7649"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.6/701320d/liblab-v0.38.6-701320d-linux-x64.tar.gz"
    sha256 "dd621f04e25aa2c46f432fcdee41db5657474cf96bf9b98ff9b6f57f900a3e68"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end