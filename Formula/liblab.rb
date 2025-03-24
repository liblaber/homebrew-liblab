require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.19"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/d7aef01/liblab-v0.49.19-d7aef01-darwin-x64.tar.gz"
    sha256 "4e78f8dd5c6bb126daf8b6d02d95e6a1679ca9408b61c13c52658b5c7d620b67"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/d7aef01/liblab-v0.49.19-d7aef01-darwin-arm64.tar.gz"
    sha256 "635be265f2e246d04a46385cd03b1e2f61c05abdde10648f60135e6a2078695d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/d7aef01/liblab-v0.49.19-d7aef01-linux-arm.tar.gz"
    sha256 "14e345bebbf8a550bfd47ed849cb91fb107e809167224e0cfa49ff8acbe284fd"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.19/d7aef01/liblab-v0.49.19-d7aef01-linux-x64.tar.gz"
    sha256 "5c2fe37cd98e714ace0baed3057f733e3a97da3503578c9fb30886812a612f5c"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end