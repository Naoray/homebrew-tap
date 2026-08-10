class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.9.0/anvil-1.9.0-darwin_arm64.tar.gz"
      sha256 "1e6ee756af07c8cd3d1c0842f2c27993ef1c156bcd4ffa12223822a5cfaa0752"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.9.0/anvil-1.9.0-darwin_amd64.tar.gz"
      sha256 "d3d7510cd294f68f6bbc0be3869a1999328664335dd6b478a6c3ebdf573b7f7a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.9.0/anvil-1.9.0-linux_arm64.tar.gz"
      sha256 "6d6e9edefd0d6b4dc2559e205d597f84fe8f60753f1b691f0c0ebf731d0f649f"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.9.0/anvil-1.9.0-linux_amd64.tar.gz"
      sha256 "b7dbc3c872b0554b363be86379606ac48388e0008a4d789afe15cc2c3740311e"
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
