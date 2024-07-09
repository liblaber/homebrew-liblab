require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.39.8"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.8/372e68d/liblab-v0.39.8-372e68d-darwin-x64.tar.gz"
    sha256 "a9e4e8b9c589ca8bb28052b3387711476f6c7dcfab5b944d08cc0de523ee179e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.8/372e68d/liblab-v0.39.8-372e68d-darwin-arm64.tar.gz"
    sha256 "68c1893919ae6293b8a1320bb6cc8b2703927e931e304251749ba5a1c63efe1a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.8/372e68d/liblab-v0.39.8-372e68d-linux-arm64.tar.gz"
    sha256 "95758db1fbe1d0c7f6fb21bf7a8add5db52b59638dfe17f1b0d6d34e8396274d"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.39.8/372e68d/liblab-v0.39.8-372e68d-linux-x64.tar.gz"
    sha256 "58b7cef0155c432ecae838caa47bb1dfe15e6fb60eed6f13577e9508a8e04eba"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end