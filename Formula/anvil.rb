class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.7.0/anvil-1.7.0-darwin_arm64.tar.gz"
      sha256 "ee42372308b7626525e53f62f824e72b6650f30dddbcc58668e3755f3fd71904"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.7.0/anvil-1.7.0-darwin_amd64.tar.gz"
      sha256 "44a19d20da97080bbb47a2f90090a76629d0ea9820eb5fed7fb10cd2e8ce84b7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.7.0/anvil-1.7.0-linux_arm64.tar.gz"
      sha256 "fa6ed2f91d0d83cf9e89f2a0a24e27adaf55639c8942b9025b1c82704feae957"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.7.0/anvil-1.7.0-linux_amd64.tar.gz"
      sha256 "57dc2fc09272ba32c3875e2da159b6e4099797e22cca49bc8441fa35d1d4b81c"
    end
  end

  def install
    bin.install "anvil-#{version}-darwin_arm64" => "anvil" if OS.mac? && Hardware::CPU.arm?
    bin.install "anvil-#{version}-darwin_amd64" => "anvil" if OS.mac? && Hardware::CPU.intel?
    bin.install "anvil-#{version}-linux_arm64" => "anvil" if OS.linux? && Hardware::CPU.arm?
    bin.install "anvil-#{version}-linux_amd64" => "anvil" if OS.linux? && Hardware::CPU.intel?
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/anvil version")
  end
end
