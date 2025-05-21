require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.33"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.33/4394fc3/liblab-v0.49.33-4394fc3-darwin-x64.tar.gz"
    sha256 "232508503094a0cbca10144d7fafbbad9b7d1474a0db4811f40bdaddc3c87241"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.33/4394fc3/liblab-v0.49.33-4394fc3-darwin-arm64.tar.gz"
    sha256 "10d1c8a477813fff7d1a31cef5e042fd62870853e44b15685d0e2b509d85fe3a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.33/4394fc3/liblab-v0.49.33-4394fc3-linux-arm.tar.gz"
    sha256 "73d8595d9529d030ef664700f65b377dc2f87b67fc9a13b173aaf4a49c8891a4"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.33/4394fc3/liblab-v0.49.33-4394fc3-linux-x64.tar.gz"
    sha256 "3c6deec252143eecca27841092798bb9e1b95b8fb952d5c16802caf9559616ea"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end