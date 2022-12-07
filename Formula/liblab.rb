require "language/node"

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/channels/stable/liblab-darwin-x64.tar.gz"
    sha256 "75482d6517921103dc930811e40fb6e6b6f6efed5e5990289a9f9352714c899c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/channels/stable/liblab-darwin-arm64.tar.gz"
    sha256 "78eb70b2022f119284f740e902fe880917e76cd7c9be1ed49ea10e90ac0cb605"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/channels/stable/liblab-linux-x64.tar.gz"
    sha256 "4ea69b7aaa1571ad75ea94f8d665b520b1e06f6cb39eee272d5acf528210dec2"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/channels/stable/liblab-darwin-x64.tar.gz"
    sha256 "421e7c79653e6c1ef63c4b66ddf13362adb8197e18bee0f8d02dd92ac5bcc320"
  end
  depends_on "node"

  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end

end
