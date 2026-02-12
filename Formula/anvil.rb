class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-darwin_arm64.tar.gz"
      sha256 "1ce740b3bde388d4dd020f4b64dfae8950cec2e67b89662d2de152524d02edf2"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-darwin_amd64.tar.gz"
      sha256 "0b6b357f5e85b7106e7281ff16e3b98a7ee6a5a1d936355fcbed7d31bcb8e71b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-linux_arm64.tar.gz"
      sha256 "b6572e056c8f0d76ce5d38d9b3a824a1f37cb7037dec78ecd5e7543403b6d3d4"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-linux_amd64.tar.gz"
      sha256 "1ed9a4621839ac8f0140a65fa0276f3d5da2f12ce44851fcae7ea273f4a7b107"
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
