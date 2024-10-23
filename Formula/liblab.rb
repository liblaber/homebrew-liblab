require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.3"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.3/32203de/liblab-v0.49.3-32203de-darwin-x64.tar.gz"
    sha256 "c82110b80c01768fd88354179031cf92c1366669f6aeb81485e391afedad494a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.3/32203de/liblab-v0.49.3-32203de-darwin-arm64.tar.gz"
    sha256 "38c530671eb84c10a10b3c6219da41c83e7f63e7d677365f639ba446e02369dd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.3/32203de/liblab-v0.49.3-32203de-linux-arm.tar.gz"
    sha256 "c7997359fc91d78b31c66a5660d6bf81e94a9fa3be4e84a8d2e1f774b404f509"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.3/32203de/liblab-v0.49.3-32203de-linux-x64.tar.gz"
    sha256 "361c8204db4f52e767caeb711bb386fdaa7e7f38dd7ccea81753fa9cb9dcabbd"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end