class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.13.0/anvil-1.13.0-darwin_arm64.tar.gz"
      sha256 "6ad5f36869b3588f2a84f63abc9a6d6f237e07a0177900c81ed54296cddee9af"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.13.0/anvil-1.13.0-darwin_amd64.tar.gz"
      sha256 "a6ec5adcfddf5f0735025e1e1c1e2c5f72289646f57edb30fb119d6e4c76dbad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.13.0/anvil-1.13.0-linux_arm64.tar.gz"
      sha256 "564999660bf53d9426d5972865cbf184cf110db2ff5d3ee64e62514f34b0be03"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.13.0/anvil-1.13.0-linux_amd64.tar.gz"
      sha256 "222dc628cad435248bfe380bc8f7a993279ba983a46e3f85864ac2fe3262fec7"
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
