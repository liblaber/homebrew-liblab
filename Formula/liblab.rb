require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.0/ab279ec/liblab-v0.39.0-ab279ec-darwin-x64.tar.gz"
    sha256 "a64243456b33e7e5d640714465d41dc5c15e0de5f4e62a4f3f36e066d9793c1b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.0/ab279ec/liblab-v0.39.0-ab279ec-darwin-arm64.tar.gz"
    sha256 "619ed56bcd41aeb4ba5d1858ae8c4892575088fd03bfdd6d4898352f7b599229"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.0/ab279ec/liblab-v0.39.0-ab279ec-linux-arm64.tar.gz"
    sha256 "ef532894dce635d9112aae07a771878d32108e086861284c85198d5b17f29984"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.0/ab279ec/liblab-v0.39.0-ab279ec-linux-x64.tar.gz"
    sha256 "c0f14909f049db204886de0fe6537389f87bf58dfbb3fe147143d4614d5d9ece"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end