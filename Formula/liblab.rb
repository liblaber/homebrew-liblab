require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.36"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.36/0922130/liblab-v0.49.36-0922130-darwin-x64.tar.gz"
    sha256 "fc3c0d69fdd66e381a42a2cbec7d16c6e7f919ccb561ccb279acf9a4d5334779"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.36/0922130/liblab-v0.49.36-0922130-darwin-arm64.tar.gz"
    sha256 "2dba860abc425c32d87bb868a729c58f07d617c5fe104595b5d700a6d4925377"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.36/0922130/liblab-v0.49.36-0922130-linux-arm.tar.gz"
    sha256 "b3a47262b4d3665747124144cba3d8b3f970b900d6577ade5a23ebd0ea5f98c3"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.36/0922130/liblab-v0.49.36-0922130-linux-x64.tar.gz"
    sha256 "dd40e14197d89e565b4a3db3c857488f5b7ce1a37c2af645c3bc5c8302de35ab"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end