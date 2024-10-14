require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.0/597f9fc/liblab-v0.49.0-597f9fc-darwin-x64.tar.gz"
    sha256 "317edd183fd2d9d6bea7c8fbd69074511fe73208a1f9472518b33b3bbc380fc7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.0/597f9fc/liblab-v0.49.0-597f9fc-darwin-arm64.tar.gz"
    sha256 "4b4f22ad72e9ee906d73fea19a3bf3fb8a986e9c4a4675387e4ce7d663691674"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.0/597f9fc/liblab-v0.49.0-597f9fc-linux-arm.tar.gz"
    sha256 "d020a9f32a759365cc8444a00222d1909554471112dd03a07375df76f21a154f"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.0/597f9fc/liblab-v0.49.0-597f9fc-linux-x64.tar.gz"
    sha256 "904f9492e17e4b96725f0ebc38e93016b6e7332c9f77f13c97c1ed49fdbaceeb"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end