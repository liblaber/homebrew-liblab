require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.48"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.48/0e49961/liblab-v0.49.48-0e49961-darwin-x64.tar.gz"
    sha256 "a010ece2079279a9cb4eeac6cf9b64aa77561d885b91379a1c6194108e5cd586"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.48/0e49961/liblab-v0.49.48-0e49961-darwin-arm64.tar.gz"
    sha256 "311025e8f94453e6659484a3438656864f9c50e6647647abc67fbe04d5891785"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.48/0e49961/liblab-v0.49.48-0e49961-linux-arm.tar.gz"
    sha256 "670d2fb4ed0021d5456e60d6d5bc89e7b3420f238e6771616a5aa38fafed6e30"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.48/0e49961/liblab-v0.49.48-0e49961-linux-x64.tar.gz"
    sha256 "a4fccbbae80689c6fc496219ee788923a02c1342fb8e2d3976614e87b64e81bd"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end