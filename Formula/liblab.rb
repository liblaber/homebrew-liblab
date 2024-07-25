require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.10"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.10/a2adb76/liblab-v0.39.10-a2adb76-darwin-x64.tar.gz"
    sha256 "f476b62c1594a284297d18cd75a4506945664d3116b1f957fc2edc1d1ec7bde8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.10/a2adb76/liblab-v0.39.10-a2adb76-darwin-arm64.tar.gz"
    sha256 "adaffbbb0471f877a45d4617b18b2f301c311520363b2fb5380d308338052503"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.10/a2adb76/liblab-v0.39.10-a2adb76-linux-arm64.tar.gz"
    sha256 "e92623c0ace98a1069d5992b81be1d95b0129a5bd56b3b9946748e3878f5d8a1"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.10/a2adb76/liblab-v0.39.10-a2adb76-linux-x64.tar.gz"
    sha256 "544460d65483f12dcccf942ef837c7f47ecb755a2a044e3459f5df550b0b0d3b"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end