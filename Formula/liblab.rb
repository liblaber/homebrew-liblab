require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.47"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.47/f0c26f2/liblab-v0.49.47-f0c26f2-darwin-x64.tar.gz"
    sha256 "87accaa40f74cf86578d973a353bb28cc8e5ae262aced043bae54c5800c22b1f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.47/f0c26f2/liblab-v0.49.47-f0c26f2-darwin-arm64.tar.gz"
    sha256 "6148e9f19189ab372ec3032954f26c9d484f485eb971ca1742c58593855d8b2e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.47/f0c26f2/liblab-v0.49.47-f0c26f2-linux-arm.tar.gz"
    sha256 "6bb12635e036ec34b4d29b26ebd8ee61fdd08357205cfb746a6405fb4c01ab76"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.47/f0c26f2/liblab-v0.49.47-f0c26f2-linux-x64.tar.gz"
    sha256 "ec415a47bddec9aabcec5e2e402ccfd4caf5003a45452a712a3efc948f5fd2c6"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end