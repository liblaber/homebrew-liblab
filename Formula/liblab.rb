require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.6"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.6/c1b7ef7/liblab-v0.49.6-c1b7ef7-darwin-x64.tar.gz"
    sha256 "92f77786b78cfa7d4cc10e184c4a3aa2049356e1840032ac2271c3ce24961b53"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.6/c1b7ef7/liblab-v0.49.6-c1b7ef7-darwin-arm64.tar.gz"
    sha256 "989e111029ac9505459719f5df32e3e7ea7a1279f1b981013f71b5a5e8d823f9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.6/c1b7ef7/liblab-v0.49.6-c1b7ef7-linux-arm.tar.gz"
    sha256 "65ba220d46c3af1debdd6153f010fdeceefad6f671ae91f2851547f84a592fb1"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.6/c1b7ef7/liblab-v0.49.6-c1b7ef7-linux-x64.tar.gz"
    sha256 "e48db81ebf16139c6073759429821e73d5920a9cd1a699601da0c0d4afedf080"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end