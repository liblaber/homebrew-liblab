require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.44"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.44/d580f03/liblab-v0.49.44-d580f03-darwin-x64.tar.gz"
    sha256 "77527489e72d5f4bd34121d3c490bd4ffcc0e7cd1193de85fdf23d75c8f302f0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.44/d580f03/liblab-v0.49.44-d580f03-darwin-arm64.tar.gz"
    sha256 "bb8f4920351d5de05129a97729219b6faad96a46b192c8db7928b855920b31b9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.44/d580f03/liblab-v0.49.44-d580f03-linux-arm.tar.gz"
    sha256 "85065379162dfe5be0c45ef40f141b72861971145aed0b168083c4b573b774e0"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.44/d580f03/liblab-v0.49.44-d580f03-linux-x64.tar.gz"
    sha256 "ea8a1cebfd4cd59a21d52a2af367a9975b0c272532a3b04d5c33e16ce12550be"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end