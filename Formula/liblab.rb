require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.42.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.42.0/6b4b809/liblab-v0.42.0-6b4b809-darwin-x64.tar.gz"
    sha256 "f0513be9ab519742331b1c47a37c1f8c2fcbbf849a2c9adcd6df72f38d8f3b17"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.42.0/6b4b809/liblab-v0.42.0-6b4b809-darwin-arm64.tar.gz"
    sha256 "3f09754d76b7ec0d51075d434d00649c3ea37dbfa76eadbb6159921e11a1ce4e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.42.0/6b4b809/liblab-v0.42.0-6b4b809-linux-arm64.tar.gz"
    sha256 "ac34fd41e918519e070ccc91b5cb7c6472671f8869e08074e23db91e18bfdb89"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.42.0/6b4b809/liblab-v0.42.0-6b4b809-linux-x64.tar.gz"
    sha256 "cabddea2d6c81258b8e41e92a4e995c293dd7c427e2546cbb88254eec15e3646"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end