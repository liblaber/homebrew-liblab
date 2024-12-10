require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.7"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.7/46cf3db/liblab-v0.49.7-46cf3db-darwin-x64.tar.gz"
    sha256 "557c9ee7ad7a4552bebf5fcb193edc0801edcda640641c85c31eed5813ebb138"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.7/46cf3db/liblab-v0.49.7-46cf3db-darwin-arm64.tar.gz"
    sha256 "c5116753165db93fe7ed263e0252b612344952f71cf9d3012cb54e4c3ec86725"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.7/46cf3db/liblab-v0.49.7-46cf3db-linux-arm.tar.gz"
    sha256 "3a619ead2b6d28858acbc5cdcff08798a08fc36149160280dcbed4781c4c82a6"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.7/46cf3db/liblab-v0.49.7-46cf3db-linux-x64.tar.gz"
    sha256 "7e04ef23c77a0a68d54911e02456031f834a9180c7fb196beac712bf87b7d50b"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end