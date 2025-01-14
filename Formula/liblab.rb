require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.12"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.12/a66448e/liblab-v0.49.12-a66448e-darwin-x64.tar.gz"
    sha256 "0a5cc7523ffa99127661a94748b9ea13eb6fd457053a2c8b3ba7f800b4a2446d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.12/a66448e/liblab-v0.49.12-a66448e-darwin-arm64.tar.gz"
    sha256 "3ae1bbcf2c886d8c941ca735d4488b261fdff6176cae2d7604ee7a6b985d3bb6"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.12/a66448e/liblab-v0.49.12-a66448e-linux-arm.tar.gz"
    sha256 "fee8ff0738ef9562a063ef00670befde406cc24bd6fdd219f09522ffc5349bdb"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.12/a66448e/liblab-v0.49.12-a66448e-linux-x64.tar.gz"
    sha256 "697b5bf4e3e45cc0cda01bfc7b65c298968146eb8c81f6682d54caa865724b08"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end