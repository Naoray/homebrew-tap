class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.9.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.9.1/anvil-1.9.1-darwin_arm64.tar.gz"
      sha256 "84068cdd7e18a9ad3d95e69e9260f227a46d396325bfb0a01f38be7fbc19d080"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.9.1/anvil-1.9.1-darwin_amd64.tar.gz"
      sha256 "03997510f59e5da9f77eb3df901c7b527613192db94739575d0be5f9e026c3f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.9.1/anvil-1.9.1-linux_arm64.tar.gz"
      sha256 "f7b205b3047a08ee5a5410f1761c3223ee181d2bd001e2bdd8076eccd36d7589"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.9.1/anvil-1.9.1-linux_amd64.tar.gz"
      sha256 "0d4c8d0d3db76b8575d364a5a0af20dc424f4e8103dd9fdca57c03f8514e28f2"
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
