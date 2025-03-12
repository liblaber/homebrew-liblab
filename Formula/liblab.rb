require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.16"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/2b70f4b/liblab-v0.49.16-2b70f4b-darwin-x64.tar.gz"
    sha256 "cb5ba200b0d50e941ea34c266fe6921c04f2d8c564aef8001d7233610c9356ee"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/2b70f4b/liblab-v0.49.16-2b70f4b-darwin-arm64.tar.gz"
    sha256 "396af7be466335d1b928da1d536205117b361974928d3be6ab67d11ff53ea004"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/2b70f4b/liblab-v0.49.16-2b70f4b-linux-arm.tar.gz"
    sha256 "f69c9ea6d14657195291183d270375b856ad496dc41655fd5d50db6a45f2d522"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/2b70f4b/liblab-v0.49.16-2b70f4b-linux-x64.tar.gz"
    sha256 "5993a76ac3bc073d530cafced3faf28e78f2b6efa73392b9c09176b38314e164"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end