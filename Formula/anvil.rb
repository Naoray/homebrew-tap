class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.6.0/anvil-1.6.0-darwin_arm64.tar.gz"
      sha256 "ffa1d7ead6f1418d86f7f1040d00c77eb2fcf5af846281b588e12d4af8a50aa0"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.6.0/anvil-1.6.0-darwin_amd64.tar.gz"
      sha256 "f1dc6afb7d95cfeec8f1c020c51b41bed42359e0cdd6c3d3dbdfc8f1683ed14f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.6.0/anvil-1.6.0-linux_arm64.tar.gz"
      sha256 "34d701be6cac9ed1103e3f1e89bc6ff5a83c2cf9cb86d2ae8029716ca1f361e4"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.6.0/anvil-1.6.0-linux_amd64.tar.gz"
      sha256 "fdb6e2f8ae1d7f2c8a57359f62e16de08a6212273964a9f7de02e64e1145c8c9"
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
