require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.2"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.2/1f47123/liblab-v0.38.2-1f47123-darwin-x64.tar.gz"
    sha256 "8c7a6684f1741f16ba908c2a7f0588164917f62f08543193f0c3fbb59552754d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.2/1f47123/liblab-v0.38.2-1f47123-darwin-arm64.tar.gz"
    sha256 "7b71792b52b810be25db0cf1e213c06f3990288b88bd1ab76d928aabc1235bf9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.2/1f47123/liblab-v0.38.2-1f47123-linux-arm64.tar.gz"
    sha256 "b1b99433e8858b71d9cb8b1a8770529792debc9c47a11d2392b68218e7b6efdb"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.2/1f47123/liblab-v0.38.2-1f47123-linux-x64.tar.gz"
    sha256 "b817dd6db7fdde1f2061ac842832fa63820f012b04ad5558ed34b51aaf126521"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end