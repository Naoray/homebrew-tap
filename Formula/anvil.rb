class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.3.1/anvil-1.3.1-darwin_arm64.tar.gz"
      sha256 "e2aa9647b5954717e63f0c6bfa8d17be6cd78950aedb3ce3249f34d90e29a17b"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.3.1/anvil-1.3.1-darwin_amd64.tar.gz"
      sha256 "d96fc141e8760e96ec58b93b1c59f05746e867f12935d0b88e732e2c15f0723c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.3.1/anvil-1.3.1-linux_arm64.tar.gz"
      sha256 "fd70d04dc164f6a722712745fe56691517cc9d988fdd0f9ef77b4e77adb598ee"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.3.1/anvil-1.3.1-linux_amd64.tar.gz"
      sha256 "6dd463adc771ba17ab0b02ed8e4ecd4dd9429cbfcfbd6eac9867d7772907fa11"
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
