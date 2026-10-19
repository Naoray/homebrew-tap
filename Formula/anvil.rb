class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.12.0/anvil-1.12.0-darwin_arm64.tar.gz"
      sha256 "d1f4615a677b80f2dd137aa614735df74dc904fdc07f304ff64a24bd68f423c8"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.12.0/anvil-1.12.0-darwin_amd64.tar.gz"
      sha256 "1a84eae15a55b28ebf984cc70fa77b2021de2dec8de5205bb7016786e1d6ae0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.12.0/anvil-1.12.0-linux_arm64.tar.gz"
      sha256 "2632dacc352be26a7c14be4be81bf518cbd47a4a8b8574a752cca5f44e78d519"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.12.0/anvil-1.12.0-linux_amd64.tar.gz"
      sha256 "7068688abb633a681f8025203a9eca3d8a047f7807e96451c520a7672f65a7b2"
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
