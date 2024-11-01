require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.5"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.5/45c9a22/liblab-v0.49.5-45c9a22-darwin-x64.tar.gz"
    sha256 "08ddd90a883e9a19c152fcae1e4ae9b2bfc2ea770d32bcfe3aa0c22e3ebc1101"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.5/45c9a22/liblab-v0.49.5-45c9a22-darwin-arm64.tar.gz"
    sha256 "ed506f6d95970133d3d8e0f5a0f85517a40bafb9a7a03aafe4462f2646dd9263"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.5/45c9a22/liblab-v0.49.5-45c9a22-linux-arm.tar.gz"
    sha256 "f6ff6ec2fe728e2fbdca200eb40132fdb3fc652f0d8106c3927654838d1e1d89"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.5/45c9a22/liblab-v0.49.5-45c9a22-linux-x64.tar.gz"
    sha256 "f0365914076654476d53759885243ec37a5670aacd4f34c277ae4bd0bb008660"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end