require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/dd083b7/liblab-v0.49.1-dd083b7-darwin-x64.tar.gz"
    sha256 "db9478c19a27bcaacee793b9ad14e7985ee404f643480ad8803f815d852c858f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/dd083b7/liblab-v0.49.1-dd083b7-darwin-arm64.tar.gz"
    sha256 "f82a9160fa4c7c59e562c35fe99f419c9ab6fd008f4da41ef37aebcecba0cc72"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/dd083b7/liblab-v0.49.1-dd083b7-linux-arm.tar.gz"
    sha256 "d5a1badbaf071565b4e2fd47ead94144161f12a930d0ce8b0b62d9a4f8e662f9"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/dd083b7/liblab-v0.49.1-dd083b7-linux-x64.tar.gz"
    sha256 "e52619a2180a4872a7afc8d13a9775c6f757a8561da2a2431eceeed6cc2f5ff1"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end