require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.47.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.1/0f10c98/liblab-v0.47.1-0f10c98-darwin-x64.tar.gz"
    sha256 "6e176612a609982c93301e9b58bf3d41f501acf37e97347d4c888e91560b4972"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.1/0f10c98/liblab-v0.47.1-0f10c98-darwin-arm64.tar.gz"
    sha256 "d6f3347e280f256add8d8de6ddf1005397cbcecd4f693acb8dfe754e149508b9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.1/0f10c98/liblab-v0.47.1-0f10c98-linux-arm64.tar.gz"
    sha256 "774107eec0a3ae3b5b2594ed702c35082d93feb7fce7cf66c8264db9ea273c93"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.47.1/0f10c98/liblab-v0.47.1-0f10c98-linux-x64.tar.gz"
    sha256 "db66858e2e3d4ce80fba89d1ece579d13b229d9d389cc761b81f54e16fde2dd8"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end