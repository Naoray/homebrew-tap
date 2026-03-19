class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.5.1/anvil-1.5.1-darwin_arm64.tar.gz"
      sha256 "312abe9aa922c91ac0942b7824e6e9091c29ff78f820c5a1bb510c8e0e0f69da"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.5.1/anvil-1.5.1-darwin_amd64.tar.gz"
      sha256 "755bf338a0ef8ed63e1c112f7ae1706ad33430762bde918e09e1d1e109cce9d5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.5.1/anvil-1.5.1-linux_arm64.tar.gz"
      sha256 "8556e0f032d818895fa087f90900251198d344a0ca91fdcc2c4aa215970e1544"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.5.1/anvil-1.5.1-linux_amd64.tar.gz"
      sha256 "2cf5dc1e1798a2486cdca30e00f49c6603d28c0dc71610d7380c0ed4a2b43054"
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
