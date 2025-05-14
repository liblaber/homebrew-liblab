require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.49.27"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.27/e23b6b7/liblab-v0.49.27-e23b6b7-darwin-x64.tar.gz"
    sha256 "a7b31aac9a8ffb84ec8b414c16fb603842ee27c40e2cc58d9a82de3e2125409d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.27/e23b6b7/liblab-v0.49.27-e23b6b7-darwin-arm64.tar.gz"
    sha256 "3f031a697edf9f218ccd4df4a4c1e3402c772b6c53f3429478280f24a27537d2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.27/e23b6b7/liblab-v0.49.27-e23b6b7-linux-arm.tar.gz"
    sha256 "5dbf746fd1289b37284978235c4a2f9bea3aa141deedb6f2501abc2c7b713a42"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.49.27/e23b6b7/liblab-v0.49.27-e23b6b7-linux-x64.tar.gz"
    sha256 "956ae12d74932230919ce25eeb1fe99ed2d85230e707ab2ecde3beb142255f9d"
  end
  depends_on "node"
  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}
CLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end
end