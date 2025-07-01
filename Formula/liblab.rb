require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.42"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.42/d131e9f/liblab-v0.49.42-d131e9f-darwin-x64.tar.gz"
    sha256 "71f55f8cc92568ec56c376c51060bd5798dab1cdff037dff627784feb2ae3ae4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.42/d131e9f/liblab-v0.49.42-d131e9f-darwin-arm64.tar.gz"
    sha256 "5da4ed719c25e12e238c39479778e41ea3b78528a631581f0cd8040874f29d91"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.42/d131e9f/liblab-v0.49.42-d131e9f-linux-arm.tar.gz"
    sha256 "80304fc9df31c6a99b76b3ee30fd59a20b107c2c92e1eed5992258a7de79972b"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.42/d131e9f/liblab-v0.49.42-d131e9f-linux-x64.tar.gz"
    sha256 "25139766c616ac893c54f51fc93e62586e2349e838c1066e13ec10d453b9375f"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end