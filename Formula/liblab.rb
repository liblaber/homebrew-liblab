require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.7"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/d921ab3/liblab-v0.38.7-d921ab3-darwin-x64.tar.gz"
    sha256 "e396a4c39c423f139e0f84a0e9ac328086bf1e1b7ce6ecc91e690c49b60fd336"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/d921ab3/liblab-v0.38.7-d921ab3-darwin-arm64.tar.gz"
    sha256 "1d5b32aa8fb70277be3a3a456f9f990057a776f68c6621902c6085889ffa6255"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/d921ab3/liblab-v0.38.7-d921ab3-linux-arm64.tar.gz"
    sha256 "d46be6770b058fd16d3a14287a27675fad706a1759e859ebb6e70ba56a8620bb"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/d921ab3/liblab-v0.38.7-d921ab3-linux-x64.tar.gz"
    sha256 "97f4d1be171066672a6b528d00f893b720d055d3ee9ce4577be12b9819791160"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end