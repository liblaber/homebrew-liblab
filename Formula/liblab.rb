require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.14"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.14/d3dcebf/liblab-v0.49.14-d3dcebf-darwin-x64.tar.gz"
    sha256 "a4dae124f6159b59682f8e6f6f020cb9b90614c4fda4cb8f94e3073521374490"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.14/d3dcebf/liblab-v0.49.14-d3dcebf-darwin-arm64.tar.gz"
    sha256 "a85bebd70501439fb41a6590a41016b199eaf9661db540c17b3107225f22a208"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.14/d3dcebf/liblab-v0.49.14-d3dcebf-linux-arm.tar.gz"
    sha256 "f1e67fcbf0ffd2397bd6564502f88aa0a4d75e19b31fabf901f52476f4b6a4f1"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.14/d3dcebf/liblab-v0.49.14-d3dcebf-linux-x64.tar.gz"
    sha256 "e6d788d048652fdaf780329e9b1230bc9669ad78ccc39f8c2b8fb08a9904a760"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end