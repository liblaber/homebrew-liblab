require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.46.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.46.0/56e902f/liblab-v0.46.0-56e902f-darwin-x64.tar.gz"
    sha256 "7d185f99871506987efcfa78c31fc40f8f11429ab4e3d1d264b06ab22f93f497"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.46.0/56e902f/liblab-v0.46.0-56e902f-darwin-arm64.tar.gz"
    sha256 "7f439e7c2e5d340d568216f700c1ff37db48c0b141b1414d39fc56708d5d7af8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.46.0/56e902f/liblab-v0.46.0-56e902f-linux-arm64.tar.gz"
    sha256 "c3439a41ffa7474487e1647f7fd95ddd265d28ae311c3bafd7efc94891548c51"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.46.0/56e902f/liblab-v0.46.0-56e902f-linux-x64.tar.gz"
    sha256 "46cbe25b760b46403266741f7a6a6e709ba44f90351047a31d604f60766c5478"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end