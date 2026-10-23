class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.14.0/anvil-1.14.0-darwin_arm64.tar.gz"
      sha256 "f95933352aff7fad9d97ae6357eed281565a195d156f90b6f14906a5d88c006e"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.14.0/anvil-1.14.0-darwin_amd64.tar.gz"
      sha256 "390c07aae97d875a14688db1854f7079dc828df613848dd29ec652277f316667"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.14.0/anvil-1.14.0-linux_arm64.tar.gz"
      sha256 "75630bc4bded697ad03f9ebe37e4a7005d69e2bd9e9c5b59f25df2f08aa58b23"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.14.0/anvil-1.14.0-linux_amd64.tar.gz"
      sha256 "0b95d74d32fab2de5f285041cac8d360e5b98e60021789cb007bd71285184f08"
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
