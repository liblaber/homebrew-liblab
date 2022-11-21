require 'formula'

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta8"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-amd64-cli.zip"
    sha256 "97f1cdc3faa63beb893d8da8b97854033a00ccab35cf257f4a5a3805eacff945"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-arm64-cli.zip"
    sha256 "660244dabf4f4c6135218e33d8c793b5bf83dd2a3de6a910cee350fc2e57a9eb"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-linux-x64-cli.zip"
    sha256 "1546dfc868fa9293acae9fbfd1bc85d54b20f9bf2784e5858a4be62123d71443"
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
    assert_equal "liblab-cli v0.0.1-beta8", shell_output("#{bin}/liblab version")
  end
end
