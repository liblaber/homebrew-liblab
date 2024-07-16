require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.9"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.9/604a913/liblab-v0.39.9-604a913-darwin-x64.tar.gz"
    sha256 "c2a2838aab30990cc01a051cd01d466bae8e5b00c3d738f5180205c841e62a7f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.9/604a913/liblab-v0.39.9-604a913-darwin-arm64.tar.gz"
    sha256 "3bdc4843b3b5362ae2053744df085624bcad6b1396b16eca75d5520aaeb4b292"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.9/604a913/liblab-v0.39.9-604a913-linux-arm64.tar.gz"
    sha256 "e7fa50215c795defa50ba53cc4d6f9f59459d97d6b943c1a64ccd28e9230975a"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.9/604a913/liblab-v0.39.9-604a913-linux-x64.tar.gz"
    sha256 "aeec226d53e142681034270e0348d75f5b1736c06e454d453de0cc58cd2d42a0"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end