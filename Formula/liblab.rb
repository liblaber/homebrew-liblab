require 'formula'

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-amd64-cli.zip"
    sha256 "bde402a5b75809c5d87c8d2ac5ce730d34eb422d258005072ada9b4681602fbf"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-arm64-cli.zip"
    sha256 "50c699456a84558a8c04bd151a39952e50425cfd401e38738ee777542f15e2e0"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-linux-x64-cli.zip"
    sha256 "1cf24a5440dc1481194e688b858a48b94b74644472784f3a513ef4c7336de779"
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
      bin.install_symlink "libexec/liblab_linux_amd64" => "liblab"
    end
  end

  test do
    assert_equal "liblab-cli v0.0.1-beta", shell_output("#{bin}/liblab version")
  end
end
