class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.8.0/anvil-1.8.0-darwin_arm64.tar.gz"
      sha256 "78624a531f127bf28976808cff3d58c1e3af8f7d4c701e939064231de48f1807"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.8.0/anvil-1.8.0-darwin_amd64.tar.gz"
      sha256 "d15c0ef53e98b286d4fc9adeff29f0ae56a1188ab6ec47971a9d651e5963ba77"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.8.0/anvil-1.8.0-linux_arm64.tar.gz"
      sha256 "399ba455c05e0a231a6f45f92952f61caeda6c89de575aedb248a2162eb0de7b"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.8.0/anvil-1.8.0-linux_amd64.tar.gz"
      sha256 "8e60d25322b2424a0f0120e40d815304fc8e486d6248a5fd8e975dd2605fb97d"
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
