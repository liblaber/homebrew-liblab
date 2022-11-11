require 'formula'

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta7"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-amd64-cli.zip"
    sha256 "445b12dab1c4d93c7f649ceaf03b76cd70a32374647708a3905231e68a292eca"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-arm64-cli.zip"
    sha256 "b1e75e2d2428ad0644e077a7adbbdffdde8f473954caee9d9c3055906b3a4a47"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-linux-x64-cli.zip"
    sha256 "7d551f1d82f99c8de4976f9f3bc24f7d456bdfb9016593a2975dbb0b043fc432"
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
