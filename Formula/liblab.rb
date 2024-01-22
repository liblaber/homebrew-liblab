require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8b9ddf9/liblab-v0.35.1-8b9ddf9-darwin-x64.tar.gz"
    sha256 "02d309c76edbf0761d70173eaa91927ad8b23b7273716115ea65dd041119ec53"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8b9ddf9/liblab-v0.35.1-8b9ddf9-darwin-arm64.tar.gz"
    sha256 "480a78c1dffc1334da183f065f7f13142d7bb9af0e7525a06a6c5d685b0d735d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8b9ddf9/liblab-v0.35.1-8b9ddf9-linux-arm64.tar.gz"
    sha256 "e22d01322bb6fb01b567a672d26ff76d02793e78b8f64fe82f6ca468a4e3f840"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8b9ddf9/liblab-v0.35.1-8b9ddf9-linux-x64.tar.gz"
    sha256 "171421b18445bc78ad46484c9123cc147ae1b6f1176969f3b7cd93b542274a78"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end