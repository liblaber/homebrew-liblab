require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.6"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.6/dfbce7a/liblab-v0.39.6-dfbce7a-darwin-x64.tar.gz"
    sha256 "5d402cbd4bd6337f4e2d1c5dec91d3b32d48771371dee7a54d1209345b397324"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.6/dfbce7a/liblab-v0.39.6-dfbce7a-darwin-arm64.tar.gz"
    sha256 "cdcba0347fe65ce61412f17e0dcf9d10368f9824d4433ac6e5df0268b0e9e383"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.6/dfbce7a/liblab-v0.39.6-dfbce7a-linux-arm64.tar.gz"
    sha256 "fcd52a596b96e5f6b22dc6f089ca80b2533182f1c225bd580ccad91e071ab982"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.6/dfbce7a/liblab-v0.39.6-dfbce7a-linux-x64.tar.gz"
    sha256 "5097ec0a247c01f3e58f01d470e9300bb0a06f7da558d33283df5046b052dab3"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end