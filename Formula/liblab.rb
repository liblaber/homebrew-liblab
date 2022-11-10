require 'formula'

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-amd64-cli.zip"
    sha256 "1704461c60e6276a9827b4a0a992613a77e79f4f3a742bc2cde4f4d232c021ae"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-arm64-cli.zip"
    sha256 "f4a3c6cef25300cd1f3db90753be0400dff84664a25160de78f3f700fab280f1"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-linux-x64-cli.zip"
    sha256 "2d9ec27c139bd2a3c1f53eeb60f2358b6902def949d759ff3c80c1220d9b386d"
  end

  def install
    
    libexec.install Dir["*"]
    
    if OS.mac? && Hardware::CPU.intel?
      chmod(0755, "#{libexec}/liblab_macos_amd64")
      bin.install_symlink libexec/"liblab_macos_amd64" => "liblab"
    elsif OS.mac? && Hardware::CPU.arm?
      chmod(0755, "#{libexec}/liblab_macos_arm64")
      bin.install_symlink libexec/"liblab_macos_arm64" => "liblab"
    elsif OS.linux?
      chmod(0755, "#{libexec}/liblab_linux_amd64")
      bin.install_symlink libexec/"liblab_linux_amd64" => "liblab"
    end
  end

  test do
    assert_equal "liblab-cli v0.0.1-beta", shell_output("#{bin}/liblab version")
  end
end
