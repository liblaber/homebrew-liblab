require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.18"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.18/e32a619/liblab-v0.49.18-e32a619-darwin-x64.tar.gz"
    sha256 "5589de94acd428b2c384431d0206f5365b90fdfb79cd06accb3352b83b671bbd"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.18/e32a619/liblab-v0.49.18-e32a619-darwin-arm64.tar.gz"
    sha256 "2812411dfb4cb6e2591b958cd307e15a5e8ba1eb78101423ed7c0fbe3ecf589c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.18/e32a619/liblab-v0.49.18-e32a619-linux-arm.tar.gz"
    sha256 "bfe6435efcc1c2e10c94810cea9d660055484bad8588d8f30a0b9b4d1bdb283a"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.18/e32a619/liblab-v0.49.18-e32a619-linux-x64.tar.gz"
    sha256 "dfc6f7c58c21be7324776bcac34d831479dc23ab7dd0f0c204b7b3f132f5e258"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end