require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.4"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.4/fe0e519/liblab-v0.39.4-fe0e519-darwin-x64.tar.gz"
    sha256 "f6f5b05580de78baf368f180cba859360c7820565f6e90aaedf92b2ffbda0076"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.4/fe0e519/liblab-v0.39.4-fe0e519-darwin-arm64.tar.gz"
    sha256 "897ce47fb33b44362fa5076015050df6ebe9673ac2d2b50fc43739126d9ad232"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.4/fe0e519/liblab-v0.39.4-fe0e519-linux-arm64.tar.gz"
    sha256 "42c4d551d4ba7ba6a4a73a1cd5116586961ebbe6a278e9fd0155a6b700d30dd5"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.4/fe0e519/liblab-v0.39.4-fe0e519-linux-x64.tar.gz"
    sha256 "43a6b0662801c0cbb1f452047545e12bae856d76c16347271ada30ae4f37df99"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end