class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-darwin_arm64.tar.gz"
      sha256 "1d8390361d817e0d462ea97234cce3dcaecdd9fbad3806cb3a3bd6e263469640"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-darwin_amd64.tar.gz"
      sha256 "d184dded49f5c6a6a699129b1d8fcd6e6773021406b86b6479e077a5ce22ce0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-linux_arm64.tar.gz"
      sha256 "2365df5941e57ab0d149fcd955d257c6c56caf8ca717675488ab1f591762a6f1"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.1.0/anvil-1.1.0-linux_amd64.tar.gz"
      sha256 "74479419f321d45e0aa87bd75ef3e660163b5ba05c7864c10ada66b78c1efeec"
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
