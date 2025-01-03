require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.11"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.11/79e1284/liblab-v0.49.11-79e1284-darwin-x64.tar.gz"
    sha256 "a80976b09d3a4bf811b37b0a92887d492d7e1e26f54d7be6ffc3bc7c7199db33"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.11/79e1284/liblab-v0.49.11-79e1284-darwin-arm64.tar.gz"
    sha256 "7f0fc5c827b2679f17d006c383f2224e7e36d580e7003c69065cccf80c9efd0f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.11/79e1284/liblab-v0.49.11-79e1284-linux-arm.tar.gz"
    sha256 "ed6cc450f9e2adad034dc8d4c3802216c7b7d92f8b6377d9e65cc8c4349922e0"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.11/79e1284/liblab-v0.49.11-79e1284-linux-x64.tar.gz"
    sha256 "18ff3c17a513b890aa0754c8e49ac97b3df5f8a5d75597cd11933ad3d4a56b39"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end