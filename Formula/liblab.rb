require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.43"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.43/847c408/liblab-v0.49.43-847c408-darwin-x64.tar.gz"
    sha256 "c7ddd01e401dbc5c4eaca53f12071074b807281022b690397aa2646a4aa23a5d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.43/847c408/liblab-v0.49.43-847c408-darwin-arm64.tar.gz"
    sha256 "b7f6ee7de09597788f072168d9c18212c51e9fc06bb0b9facff1d025dbb4bc76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.43/847c408/liblab-v0.49.43-847c408-linux-arm.tar.gz"
    sha256 "0921f19d0bfbf1c032da9d18bf23edece9ef26e6f71d07acf54bb8899297866d"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.43/847c408/liblab-v0.49.43-847c408-linux-x64.tar.gz"
    sha256 "dd8b3384d9f27a365f3d972314c1b872ae81a9a86c46cd3c74861260dcbac401"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end