require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.41"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.41/1b33e03/liblab-v0.49.41-1b33e03-darwin-x64.tar.gz"
    sha256 "e71fd3f34bf39c74a66f85b2592ee19d76d1c398388a7af8188c97ef9f3aa353"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.41/1b33e03/liblab-v0.49.41-1b33e03-darwin-arm64.tar.gz"
    sha256 "babb9a5497f47a83217377dabf5e8563e90f2a88b470fb4f242276eff54594ef"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.41/1b33e03/liblab-v0.49.41-1b33e03-linux-arm.tar.gz"
    sha256 "fb6832aa7501e941e141a3ce26d8ccd87eb5d6eb86dffb29c8b25d8eae89a869"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.41/1b33e03/liblab-v0.49.41-1b33e03-linux-x64.tar.gz"
    sha256 "36177c45ada299df3773c3c46472ca75165e19cb95f6b9f151b6f8bc83d134b9"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end