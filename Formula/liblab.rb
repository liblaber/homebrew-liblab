require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.16"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/8ba8fc5/liblab-v0.49.16-8ba8fc5-darwin-x64.tar.gz"
    sha256 "9e30e909068eb81530e73de9e3b2504be1956440647acb723a859914872d1a4f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/8ba8fc5/liblab-v0.49.16-8ba8fc5-darwin-arm64.tar.gz"
    sha256 "5f5b05924c7f693c440a74d7f579751170dc7ca50f32afcf59c7a6a6913f69ad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/8ba8fc5/liblab-v0.49.16-8ba8fc5-linux-arm.tar.gz"
    sha256 "7858b9571534ed41f1306099f7f8e8cae0710cce8f5ce02ff84a3c1adbc6e27c"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.16/8ba8fc5/liblab-v0.49.16-8ba8fc5-linux-x64.tar.gz"
    sha256 "b5beee37eee695703501372f5d08165821bf41dbe00ba1cafb0873cd56a88b77"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end