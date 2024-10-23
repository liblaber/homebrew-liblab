require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/b721c3d/liblab-v0.49.1-b721c3d-darwin-x64.tar.gz"
    sha256 "faaa1ec78d7325677f2bc1f23bd0520039cfc6f22dbc587b6d0c3ba0b81d3c57"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/b721c3d/liblab-v0.49.1-b721c3d-darwin-arm64.tar.gz"
    sha256 "525db96456ac02ada159140ce2fe4975312ab30b6b38daa0119d251b7d09d34b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/b721c3d/liblab-v0.49.1-b721c3d-linux-arm.tar.gz"
    sha256 "ffef65ae134089552f74d7d46143cabe87aff7f9cc8dd3afcfe898d83539a6d5"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.1/b721c3d/liblab-v0.49.1-b721c3d-linux-x64.tar.gz"
    sha256 "22fce1ad33fb55aed0ea34d94c2114acef423987c03eeb39dea0f85b6b9d8d88"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end