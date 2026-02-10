class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.0.0/anvil-1.0.0-darwin_arm64.tar.gz"
      sha256 "9c2ea50cc3bec09e9f9d3a82a458d4bb576c174d170df842a340c5788bbaa531"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.0.0/anvil-1.0.0-darwin_amd64.tar.gz"
      sha256 "70be58c62a495013cd572c504893ff221728ee8e53bb6ba7ab80162eb03990c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.0.0/anvil-1.0.0-linux_arm64.tar.gz"
      sha256 "bb969b9bea60790828f9425a7ac3d1a28da9d25697727c1eaf44bba14e38c676"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.0.0/anvil-1.0.0-linux_amd64.tar.gz"
      sha256 "7a84372793ce5d6703697d9eaedc448d515a515158bc7643c6d8287c203089af"
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
