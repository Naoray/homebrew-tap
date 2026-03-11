class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.4.0/anvil-1.4.0-darwin_arm64.tar.gz"
      sha256 "20b49065eec1cb1d71f5c43c7e25a962f29de5b27ec6bc839a8dfa712759dc9a"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.4.0/anvil-1.4.0-darwin_amd64.tar.gz"
      sha256 "533af47f9e0d53c266b491397c223f9187ab2c95130b250b11efa02fd0940fd2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.4.0/anvil-1.4.0-linux_arm64.tar.gz"
      sha256 "f3feff888f6d1dbfddbad4f0aee01cf849a61b695a304d866c44ef8f1c60c28a"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.4.0/anvil-1.4.0-linux_amd64.tar.gz"
      sha256 "d4306b943ea5966e144d1c54146e6a51c9d3d93b47ea72ea4a559023b2b7a760"
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
