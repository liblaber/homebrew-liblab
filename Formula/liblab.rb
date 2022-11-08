require 'formula'

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta5"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-amd64-cli.zip"
    sha256 "8ace28ac865672498e78f31275671edb423a70238b6aeb5d8cabe2638d89fdbe"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-macos-arm64-cli.zip"
    sha256 "59cb877567ee9c987c652b93f973f95fb751baa6ce6dcc8822fbea2429ad0ef7"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/#{version}/liblab-linux-x64-cli.zip"
    sha256 "674113911332b471d3029059fa92be7325002984ca5837764a2b435a7a94c979"
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
