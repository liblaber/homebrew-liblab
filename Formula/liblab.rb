require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.3"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.3/df42f0f/liblab-v0.38.3-df42f0f-darwin-x64.tar.gz"
    sha256 "38d763392865f2487cfeade7a7502aa5ef10c9d244eb5dee5954697dcbf3cd0e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.3/df42f0f/liblab-v0.38.3-df42f0f-darwin-arm64.tar.gz"
    sha256 "90813f702408724934540874acc37d44a2e8c0eaa87b4af1277117359a02d467"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.3/df42f0f/liblab-v0.38.3-df42f0f-linux-arm64.tar.gz"
    sha256 "261946accf712f84490bbbef4e67dfa2c0c8f31484b4df4e50a426f292257457"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.3/df42f0f/liblab-v0.38.3-df42f0f-linux-x64.tar.gz"
    sha256 "fe9bdfc1449147d7be16b84aa3172055d7b32f63d3221daa1d18af37d688456b"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end