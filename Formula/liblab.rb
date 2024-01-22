require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/72eb6ed/liblab-v0.35.1-72eb6ed-darwin-x64.tar.gz"
    sha256 "3a0ea2e77cff4690fd520586984b525f7af131c9ecdc898146f001946c9fc39d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/72eb6ed/liblab-v0.35.1-72eb6ed-darwin-arm64.tar.gz"
    sha256 "89d52c5d36e142a434d65013ae33c13d6d990adfe6d32ebf03bd040b0ca21715"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/72eb6ed/liblab-v0.35.1-72eb6ed-linux-arm64.tar.gz"
    sha256 "0715a08715531e458af26dd59576a51f7252ca0ab07512a016166202fc9efb56"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/72eb6ed/liblab-v0.35.1-72eb6ed-linux-x64.tar.gz"
    sha256 "4f95909ddd91d950bd7afcd1f71cd6722812066bee50ecff175edc722863590d"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end