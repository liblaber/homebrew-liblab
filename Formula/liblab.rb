require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.4"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/2615881/liblab-v0.41.4-2615881-darwin-x64.tar.gz"
    sha256 "3c3b57939ee54b5f9d14e82425388d14d30f8f87f3fca20e7ca2798d28d6830d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/2615881/liblab-v0.41.4-2615881-darwin-arm64.tar.gz"
    sha256 "54f8d78f1af50f465c051d5251ad4baa3f9a7949061b4c2f27671f9badf033fd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/2615881/liblab-v0.41.4-2615881-linux-arm64.tar.gz"
    sha256 "1508a5933d7fe32cb481c89c2b5d1e0893ce9b235cd24aee15291de97aa1fa70"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/2615881/liblab-v0.41.4-2615881-linux-x64.tar.gz"
    sha256 "7632d40cfa4991131e545b20c86088e3e64987198c63869f978ece7cb4adf5cf"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end