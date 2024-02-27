require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.0/d377ff9/liblab-v0.38.0-d377ff9-darwin-x64.tar.gz"
    sha256 "617ef77c443cab1f3a9c0249734888c1765a183cc3df896ec54d9724f17a3d64"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.0/d377ff9/liblab-v0.38.0-d377ff9-darwin-arm64.tar.gz"
    sha256 "3c589d860f88708e8239fd1ceb3376258c4d402a8baaf6a60817fab8bf835d68"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.0/d377ff9/liblab-v0.38.0-d377ff9-linux-arm64.tar.gz"
    sha256 "3d522ba51d890f0b2914fe1d80d600c9f9d1cabacae3ea0e406521909b5f5fca"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.0/d377ff9/liblab-v0.38.0-d377ff9-linux-x64.tar.gz"
    sha256 "38915ef89e67d282a7868643f47117e64d403b01ff4359b9af1971d1952fdc1f"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end