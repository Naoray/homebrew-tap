class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.1.1/anvil-1.1.1-darwin_arm64.tar.gz"
      sha256 "a24cc9d6e883c4e7c4b98016232b333e4ef713534a16bf591e223e2df5fcc879"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.1.1/anvil-1.1.1-darwin_amd64.tar.gz"
      sha256 "8565c63d753158651528bcd30177da003bed67026f79f75c8a74a5c8f76c8be6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.1.1/anvil-1.1.1-linux_arm64.tar.gz"
      sha256 "e41942163657af53046bec98c9e82da932fe9dd36ea6b8042777d5b5407a1dd2"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.1.1/anvil-1.1.1-linux_amd64.tar.gz"
      sha256 "4fc276708a97ababe6ba04a0fcbe287133a931c9fc2f87eff9fb9b6e65cbe01e"
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
