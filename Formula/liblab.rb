require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.44.0"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.44.0/72568cf/liblab-v0.44.0-72568cf-darwin-x64.tar.gz"
    sha256 "3ec3bbd978e09cff48eef7d4a49f9b639d3b2b977f084f0f721d8618f8c4dc16"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.44.0/72568cf/liblab-v0.44.0-72568cf-darwin-arm64.tar.gz"
    sha256 "7a3942b0cbd8fa08cfc84b47f2713363e6fdb14b65b86c2ab21286b8562704c5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.44.0/72568cf/liblab-v0.44.0-72568cf-linux-arm64.tar.gz"
    sha256 "17a6436466d62e867c411bacbd7239afb1c0a5c7bd666d9855232508cb03a36d"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.44.0/72568cf/liblab-v0.44.0-72568cf-linux-x64.tar.gz"
    sha256 "b675be1383455413c07208164b490eec0546c2b1624f208c138ec7e0294453ea"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end