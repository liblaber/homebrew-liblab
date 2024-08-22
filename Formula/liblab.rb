require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.41.4"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/e3e5786/liblab-v0.41.4-e3e5786-darwin-x64.tar.gz"
    sha256 "c5a356d0e07c67e67d522116037855b85cdecbb098743582b30c09867f64f1dc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/e3e5786/liblab-v0.41.4-e3e5786-darwin-arm64.tar.gz"
    sha256 "d0630ad546b40ae36fedb5004bbf65eff7a8c218817b2b8c573cf8c054dc88cf"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/e3e5786/liblab-v0.41.4-e3e5786-linux-arm64.tar.gz"
    sha256 "353348c3b42b4797ef7cf2cbdbf895d7e3910a09555e9dffaf74134321db7872"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.41.4/e3e5786/liblab-v0.41.4-e3e5786-linux-x64.tar.gz"
    sha256 "590874b332c4548acfb0d842a9a0092d0ca7409ce83147d80fb04dceb3720b91"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end