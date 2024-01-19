require "language/node"
class Liblab < Formula
  desc "liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1"
  if OS.mac? && Hardware::CPU.intel?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8245273/liblab-v0.35.1-8245273-darwin-x64.tar.gz"
    sha256 "eb8cde94b9029e204692ba42a6cfa2c00b378daa4129cc82455f0000a02eb7f0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8245273/liblab-v0.35.1-8245273-darwin-arm64.tar.gz"
    sha256 "68cfe87db7ad009e813711991cae547b62905bacc08c8566e2efb0e698e7642a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8245273/liblab-v0.35.1-8245273-linux-arm64.tar.gz"
    sha256 "38974a9f39f279386dc86bfa63dea4541ec2a959cede8b863f95c8d78a5d9d55"
  elsif OS.linux?
    url "https://dev-liblabl-cli-binaries.s3.amazonaws.com/versions/0.35.1/8245273/liblab-v0.35.1-8245273-linux-x64.tar.gz"
    sha256 "04134398dde39051f8d043f3682756eebf52c9ba35d8539af42c6fad624fd5b7"
  end
  depends_on "node"

  def install
    inreplace "bin/liblab", /^CLIENT_HOME=/, "export LibLab_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/liblab"
  end

end
