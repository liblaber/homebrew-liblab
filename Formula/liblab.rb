require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.38.7"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/f57d48b/liblab-v0.38.7-f57d48b-darwin-x64.tar.gz"
    sha256 "6b9ab3b23e5a80ac3b6c6cb46f18f16b617f6161704d140e2737c83c35f1b710"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/f57d48b/liblab-v0.38.7-f57d48b-darwin-arm64.tar.gz"
    sha256 "c40e8ffff9a640b3d8bdd9abfff780c18bc30ace4a7b3a0ced6e94b93f422202"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/f57d48b/liblab-v0.38.7-f57d48b-linux-arm64.tar.gz"
    sha256 "37c9f7e067aa03cd70f5e4d6b77e53513ebc4fb00bdc0b605bb8f0bdd82b83a0"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.38.7/f57d48b/liblab-v0.38.7-f57d48b-linux-x64.tar.gz"
    sha256 "9d953542e88b79f9f5fb068511fe7771669a4fa9aa384363a4b1fd61d7b69370"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end