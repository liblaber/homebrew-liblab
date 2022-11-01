require 'formula'

class Cli < Formula
  desc "Liblab CLI - A CLI for generating SDKs (and docs) from API specs"
  homepage "https://liblab.com"
  version "0.0.1-beta3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/0.0.1-beta3/liblab-macos-amd64-cli.zip"
    sha256 "cbf0c9074b87cadc65f8bc66fb6e655f423c036cb9c81eb37b00837a05689db2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/0.0.1-beta3/liblab-macos-arm64-cli.zip"
    sha256 "42a55645a3d97c197d9e285b2b102b1ffbb4502f6c42fe9451268961dd7d464e"
  elsif OS.linux?
    url "https://github.com/liblaber/homebrew-liblab/releases/download/0.0.1-beta3/liblab-linux-x64-cli.zip"
    sha256 "4f09bf2628518698884a534aca71db7d2c5bc63318643c00e6616101a4d0c9b4"
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
    assert_equal "Liblab CLI - A CLI for generating SDKs (and docs) from API specs

Usage: liblab <command> [arguments]

Global options:
-h, --help    Print this usage information.

Available commands:
  forgot_password   Initiates a password reset
  gen:docs          Generate docs for a given OpenAPI spec
  gen:sdk           Generate an SDK for a given OpenAPI spec
  login             Login to Liblab
  logout            Logout - Sign Out from Liblab
  register          Register a new user

Run \"liblab help <command>\" for more information about a command.", shell_output("#{bin}/liblab")
  end
end
