require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.40.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.0/91cf466/liblab-v0.40.0-91cf466-darwin-x64.tar.gz"
    sha256 "73a9f80f3dc8a12db16a1ba40cc3115ea3884535103a6ebfaec49565e1260126"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.0/91cf466/liblab-v0.40.0-91cf466-darwin-arm64.tar.gz"
    sha256 "7f973c4e4f78428ca8e8ae06794766f0dd2b275bb13415c722231c350e6e7c97"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.0/91cf466/liblab-v0.40.0-91cf466-linux-arm64.tar.gz"
    sha256 "13a0c8e82cf7e0e8aca104ede11c33466a364ed67a48ec94bd1f9d3c48357dc2"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.40.0/91cf466/liblab-v0.40.0-91cf466-linux-x64.tar.gz"
    sha256 "32c809c6e52dcec305fa06bfbcf0f8cb1ab730dbfb382c5819b1a143a320815f"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end