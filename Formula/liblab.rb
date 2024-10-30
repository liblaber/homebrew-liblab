require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.4"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.4/4622efe/liblab-v0.49.4-4622efe-darwin-x64.tar.gz"
    sha256 "9b945b4915feb7f679caa220d00f8a55b90182b0765740d918715a77748701ef"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.4/4622efe/liblab-v0.49.4-4622efe-darwin-arm64.tar.gz"
    sha256 "5195dff7a538fc398310dc00145b638433f6404ae6eea818576cbeec30fdbde1"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.4/4622efe/liblab-v0.49.4-4622efe-linux-arm.tar.gz"
    sha256 "caf3ed327311e1f3eec41bd5f1bf50d660f01666df417cc5a2f28992e166bee5"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.4/4622efe/liblab-v0.49.4-4622efe-linux-x64.tar.gz"
    sha256 "c2be0c4a71f008d2e4e3dfa5da540dd810d5f08788762a8ba1e8725527f61412"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end