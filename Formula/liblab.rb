require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.13"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.13/c570a66/liblab-v0.49.13-c570a66-darwin-x64.tar.gz"
    sha256 "9ba1adf341431e9da894c2c40ba6ceef55d86c0b7f970abf546125dc48313053"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.13/c570a66/liblab-v0.49.13-c570a66-darwin-arm64.tar.gz"
    sha256 "49066b346148ea39bbb0e9a957d1d048773ecf7ee603b2963d827281e64ba30e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.13/c570a66/liblab-v0.49.13-c570a66-linux-arm.tar.gz"
    sha256 "43060f9ba27fd25a22ed2f3d70baec5c16047baf9af6b131ad86d5a331e86436"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.13/c570a66/liblab-v0.49.13-c570a66-linux-x64.tar.gz"
    sha256 "70f42d9a6ab36d330ffb0e05d0811bac88082afb458f51b79e2edf6275175312"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end