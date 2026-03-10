class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.2.0/anvil-1.2.0-darwin_arm64.tar.gz"
      sha256 "59f4719d38b1ce4adec55f49c2ca4842789fafb0b63de3f3f570447ef291c761"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.2.0/anvil-1.2.0-darwin_amd64.tar.gz"
      sha256 "e3c21a6ee42928dc4229bfc75471c146e3b59b1662ae0e2ff1e85425f91f270b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.2.0/anvil-1.2.0-linux_arm64.tar.gz"
      sha256 "ea1689e65d5a9343497ffbb7f59dafa703a0c0ecaac0b074e604e76d4af6b124"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.2.0/anvil-1.2.0-linux_amd64.tar.gz"
      sha256 "d96a5e4a0e332807609dcad016a2781afb2004dfac7a7a6a13199dd5057eb64d"
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
