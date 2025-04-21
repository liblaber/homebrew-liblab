require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.23"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.23/61da36b/liblab-v0.49.23-61da36b-darwin-x64.tar.gz"
    sha256 "defe04b68083db565317a315778fb79cfa149b0483af79d6e3ee6d5cc49ac85c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.23/61da36b/liblab-v0.49.23-61da36b-darwin-arm64.tar.gz"
    sha256 "e130141a6427cebd5242a3e3463e757cddd98c9d6d1c6ce80ecfb414599cffe7"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.23/61da36b/liblab-v0.49.23-61da36b-linux-arm.tar.gz"
    sha256 "77c139a29e26eb65cdf763dac5a43dc53016b2ed7d1dccebfbf2f68025e70619"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.23/61da36b/liblab-v0.49.23-61da36b-linux-x64.tar.gz"
    sha256 "0a559b7b10a6ecd85dda6146cf654987a6af6951ef436dc483f9748cc24e13bc"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end