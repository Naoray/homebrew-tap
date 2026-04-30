class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.7.1/anvil-1.7.1-darwin_arm64.tar.gz"
      sha256 "3f890e13397fd9306c63af864a4ac95d74e4f31640bcf459c65c4e163d65fdf1"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.7.1/anvil-1.7.1-darwin_amd64.tar.gz"
      sha256 "e25330c9ec39c33f6194fd5af64959b4299adddd00847ca7024bd1419508c505"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.7.1/anvil-1.7.1-linux_arm64.tar.gz"
      sha256 "7926d903e311b1e58d1867ad3cd15a4ea0060665aedb8364094c89030428bc92"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.7.1/anvil-1.7.1-linux_amd64.tar.gz"
      sha256 "737fc40d417d2d2bf9fac4d44defb01592b25a9fff46706e3e99b35578fbb8b3"
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
