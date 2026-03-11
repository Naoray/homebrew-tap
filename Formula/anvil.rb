class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.3.2/anvil-1.3.2-darwin_arm64.tar.gz"
      sha256 "4587977a1450b0303459ce7d2e2f90eee36f18cffe0ae0cd74eedb89708ee468"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.3.2/anvil-1.3.2-darwin_amd64.tar.gz"
      sha256 "82ed88295198f75699ff648c1107713ed5190e00fd982273e7bbd5e6b8c5cc08"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.3.2/anvil-1.3.2-linux_arm64.tar.gz"
      sha256 "501473984bda84e2dac14e506aa5e6f689a1a1ce90d50edea16010bd03f85274"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.3.2/anvil-1.3.2-linux_amd64.tar.gz"
      sha256 "f6a6c25a31fb8716303979b22a761511ae784fd6af610dad0a1c19a034f6c892"
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
