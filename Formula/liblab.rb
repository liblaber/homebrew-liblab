require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.38"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.38/70f1bff/liblab-v0.49.38-70f1bff-darwin-x64.tar.gz"
    sha256 "578196424331553011af55604c66b76925711ae1a989591403e0a22c94038cfc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.38/70f1bff/liblab-v0.49.38-70f1bff-darwin-arm64.tar.gz"
    sha256 "2244bcaca13149e79d290f373f177c6717bec0f023a27d2e6f90e80e3bd3d206"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.38/70f1bff/liblab-v0.49.38-70f1bff-linux-arm.tar.gz"
    sha256 "12db7414eb3536910591af3d5692e9cd03bf8fcc8a9b3b20b51eb4db808ae8bf"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.38/70f1bff/liblab-v0.49.38-70f1bff-linux-x64.tar.gz"
    sha256 "465f0a6adc9cf085c18c912a47d6921f8eb9d27b7a3a9158d6e7608aca3a1f3a"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end