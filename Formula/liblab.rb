require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.8"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.8/163b9e4/liblab-v0.49.8-163b9e4-darwin-x64.tar.gz"
    sha256 "0404c3a8f7754df5ed5f382fadf689f4d2db532ee6120d0cbc743f4d0693f34e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.8/163b9e4/liblab-v0.49.8-163b9e4-darwin-arm64.tar.gz"
    sha256 "3e69442891d6d5c195ad205206c3bf37bdc91e07704740737b16e19705c982b1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.8/163b9e4/liblab-v0.49.8-163b9e4-linux-arm.tar.gz"
    sha256 "c0f88ca5556d08461b1408fcc73eee91cf70137e7edcf55fb080a3b5a6acf0a4"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.8/163b9e4/liblab-v0.49.8-163b9e4-linux-x64.tar.gz"
    sha256 "3bfe24b42a56e9dcdb2c4ee717da1494222f8a2b3c1d3a7ef12284a4aa1c5dbb"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end