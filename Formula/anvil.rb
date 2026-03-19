class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.5.0/anvil-1.5.0-darwin_arm64.tar.gz"
      sha256 "3df20da22b2687719cd2baede88f16f86b66d91d50e4cc29449ed18ed94a65d1"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.5.0/anvil-1.5.0-darwin_amd64.tar.gz"
      sha256 "e895279e1e6cafa73642f6d176b9afd6c29583bcd3118f12a9ddf2a8a72deda8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.5.0/anvil-1.5.0-linux_arm64.tar.gz"
      sha256 "42fe5a00357986d0d2f0245bc00b4c7ae64bdf430e5473b2ad0321c3590ed043"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.5.0/anvil-1.5.0-linux_amd64.tar.gz"
      sha256 "8b8d06a057015987afe055e7d0452b3618c950f3750b3d67267ad349367a6004"
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
