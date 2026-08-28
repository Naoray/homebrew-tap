class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.11.0/anvil-1.11.0-darwin_arm64.tar.gz"
      sha256 "7823d94d5325b2aff6334118cb92635e93c20bbeb330e7659c57dc621084564b"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.11.0/anvil-1.11.0-darwin_amd64.tar.gz"
      sha256 "2c90e61ac6ba8fc431670198fa24d1b1c57b91d46b9a0f0c7ef99e5967dc3af6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.11.0/anvil-1.11.0-linux_arm64.tar.gz"
      sha256 "f44c223585aa217d5c22ee3acd56ad9371054fb6df452760d588771ff8a89994"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.11.0/anvil-1.11.0-linux_amd64.tar.gz"
      sha256 "dee88288bb10ff998b1c1f0f234ac24f90f706c7e85a1025b1af645c2812d8e1"
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
