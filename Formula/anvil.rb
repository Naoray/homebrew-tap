class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.3.0/anvil-1.3.0-darwin_arm64.tar.gz"
      sha256 "66fedaf976dc6e0bfe280d62e58ed0da517e1c58581c032db6f64fd219e57c0f"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.3.0/anvil-1.3.0-darwin_amd64.tar.gz"
      sha256 "20f3cdfad71ede60e65523cc7b8c5cdc50fceb87fc4da8dcd05e1968f1891b08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.3.0/anvil-1.3.0-linux_arm64.tar.gz"
      sha256 "bc73a07f7377948de558122f7a34b519e931d4b7d320337f5dc0dbfe257d492d"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.3.0/anvil-1.3.0-linux_amd64.tar.gz"
      sha256 "c8b29c3fc6b60d20dd617a1a2797c411acd1c62d4f71699fa33e9f57e6a315c4"
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
