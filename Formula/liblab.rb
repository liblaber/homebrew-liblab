require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.5"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.5/53e25e7/liblab-v0.41.5-53e25e7-darwin-x64.tar.gz"
    sha256 "16cd18504f31ffdb38be7f88a9fc75dad71d5406768e053451d80a5fb4f7fc65"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.5/53e25e7/liblab-v0.41.5-53e25e7-darwin-arm64.tar.gz"
    sha256 "173a4cb69d2a6751cd7c831f9a4de42ca7c5a95773e1dfc0ce22cefd9516160b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.5/53e25e7/liblab-v0.41.5-53e25e7-linux-arm64.tar.gz"
    sha256 "d10c68abaaa91a73a3d6d4c7db74bb89ced658ac5a31f10f9d51a80e007553e5"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.5/53e25e7/liblab-v0.41.5-53e25e7-linux-x64.tar.gz"
    sha256 "0365d173b31463e01fad2e57dc8b3fd8f81691f45fe52b884282ad6aa0a0aca3"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end