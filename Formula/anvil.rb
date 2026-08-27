class Anvil < Formula
  desc "Git worktree manager for Laravel projects"
  homepage "https://github.com/Naoray/anvil"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.10.0/anvil-1.10.0-darwin_arm64.tar.gz"
      sha256 "115d71fcaf045dfb22485aac3bba38712e77c9e63b9d3d80f7bfa82b827c9cf6"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.10.0/anvil-1.10.0-darwin_amd64.tar.gz"
      sha256 "2f3e254d2600b504059c1bd6302f2527616b2c0d993bdff1c09d7a9553cec451"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/anvil/releases/download/v1.10.0/anvil-1.10.0-linux_arm64.tar.gz"
      sha256 "b69f975f06844bfbddd1215e4ddbb7f35d789c742fd1d792a7578f1798e3c820"
    else
      url "https://github.com/Naoray/anvil/releases/download/v1.10.0/anvil-1.10.0-linux_amd64.tar.gz"
      sha256 "dafc567295fd3d88aea440b1445b419a171556d5133e9fba0e6a7e1fe25dc399"
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
