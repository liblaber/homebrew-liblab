require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.0/c9c4457/liblab-v0.41.0-c9c4457-darwin-x64.tar.gz"
    sha256 "2da72554eed11ba253d741a221088850091d0b9ad27235f30e5774a794d80f79"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.0/c9c4457/liblab-v0.41.0-c9c4457-darwin-arm64.tar.gz"
    sha256 "9e93bd6fdbc3340c084f202741cb5c9a8dd17e2130d5858989b4951f96fd7b38"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.0/c9c4457/liblab-v0.41.0-c9c4457-linux-arm64.tar.gz"
    sha256 "f16d2ff39151d2e7cdf4b3cdd06f808923b926ed2a97ae62d5d58dcd9b8dd7d4"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.0/c9c4457/liblab-v0.41.0-c9c4457-linux-x64.tar.gz"
    sha256 "b25b534d889cf3d74546de25f6b438ef0e55cbc8d9cdfe97e670ac89cdd64c1c"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end