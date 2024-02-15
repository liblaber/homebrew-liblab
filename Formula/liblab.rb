require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.37.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.37.0/78c94aa/liblab-v0.37.0-78c94aa-darwin-x64.tar.gz"
    sha256 "1741e9d38610eacdf4c94dcbd1921503ba21e03837d7ca35dbdae8e3e902b02d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.37.0/78c94aa/liblab-v0.37.0-78c94aa-darwin-arm64.tar.gz"
    sha256 "28eae270805466c12e04db0972cde6d4d4c07bd06a1636b49941753b154761d3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.37.0/78c94aa/liblab-v0.37.0-78c94aa-linux-arm64.tar.gz"
    sha256 "3dad0ce282e45a1e88ce736b86214f6d0818a44be04e9c18a5816d2608181cab"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.37.0/78c94aa/liblab-v0.37.0-78c94aa-linux-x64.tar.gz"
    sha256 "4eddcc2a5cb23212009375059e9703b63c3323f15ccec905b3f13c9da635a76b"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end