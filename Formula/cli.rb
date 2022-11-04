require 'formula'

class Liblab < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab-cli/releases/download/#{version}/liblab-macos-amd64-cli.zip"
    sha256 "dd36986c7802d34fa98a459ab9c4f9571dfdd5748440e8d2cdb1054003af1673"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab-cli/releases/download/#{version}/liblab-macos-arm64-cli.zip"
    sha256 "6173e09a9c8778f692d720f0e1e8df6e2724dbad9101cca87d7f3f541037185c"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab-cli/releases/download/#{version}/liblab-linux-x64-cli.zip"
    sha256 "b75633dc94f1e999a8612c58bd15fd082ab979e8b3ec5c439f8157c2fee25cfc"
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
      chmod(0755, "#{libexec}/linux-x64/liblab_linux_amd64")
      bin.install_symlink libexec/linux-x64/"liblab_linux_amd64" => "liblab"
    end
  end

  test do
    assert_equal "liblab-cli v0.0.1-beta", shell_output("#{bin}/liblab version")
  end
end
