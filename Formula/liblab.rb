require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.9"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.9/fcc71ef/liblab-v0.38.9-fcc71ef-darwin-x64.tar.gz"
    sha256 "94d766be3cd92c4a28ab537bca88e31f2be63674fd722691f0e3c3cb8a2140e3"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.9/fcc71ef/liblab-v0.38.9-fcc71ef-darwin-arm64.tar.gz"
    sha256 "48fa70beb2dfbd47ea7c1b458c23a6787a7c3a04177a90ab171ddc8e3ff00a8c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.9/fcc71ef/liblab-v0.38.9-fcc71ef-linux-arm64.tar.gz"
    sha256 "8b98267e04bcbcb229f37bf7ef60136e144e48321d4320c4febc04d593e12d9e"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.9/fcc71ef/liblab-v0.38.9-fcc71ef-linux-x64.tar.gz"
    sha256 "2dfb6648e2f5f361b34aca24a5ad4ff3d5b5f6bdb1cf4ae00f4270b79332a100"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end