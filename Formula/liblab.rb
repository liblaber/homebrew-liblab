require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.29"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.29/6f670fa/liblab-v0.49.29-6f670fa-darwin-x64.tar.gz"
    sha256 "081019d7d2eed98d439f4ced897e49fe0685628277f31319cf62892b86d04e1f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.29/6f670fa/liblab-v0.49.29-6f670fa-darwin-arm64.tar.gz"
    sha256 "6c154dc257fb380c68a7a3c520d59240320356b5eebc57586e8470ef913b2e2f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.29/6f670fa/liblab-v0.49.29-6f670fa-linux-arm.tar.gz"
    sha256 "affc6f307d55eb89805b60a29d6168e534a0f47ab32500ce37d1ded8b4508d61"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.29/6f670fa/liblab-v0.49.29-6f670fa-linux-x64.tar.gz"
    sha256 "ff3603fca723457e2782291c01839618790c291ebfe6e64530101f2065529ecf"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end