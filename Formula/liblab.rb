require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.10"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.10/ddab892/liblab-v0.49.10-ddab892-darwin-x64.tar.gz"
    sha256 "1d3accfdee54c9794f8db053510f8ff8642fe398de3345f9655dd8a50f25e632"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.10/ddab892/liblab-v0.49.10-ddab892-darwin-arm64.tar.gz"
    sha256 "c8e358dfbc6213b8b00e4daf85dfa47c9764cf57bb4249f9d33d12343feae034"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.10/ddab892/liblab-v0.49.10-ddab892-linux-arm.tar.gz"
    sha256 "2cc9a0aacdff5de1edb60a0a5e486e0f4e80dafe97858cda9274209eaa1624af"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.10/ddab892/liblab-v0.49.10-ddab892-linux-x64.tar.gz"
    sha256 "051622d13747a8715e0ddb2a719d32aa713c8d466f1d3b0c8bfb0b13fd37ec6f"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end