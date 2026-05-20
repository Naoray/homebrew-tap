class Hearth < Formula
  desc "Unified Laravel development command center"
  homepage "https://github.com/Naoray/hearth"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/hearth/releases/download/v0.3.0/hearth-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "2181670a660d8b99c317c1bd6230acdd69c3c114775a9e2c438ea4b9ed8af863"
    else
      url "https://github.com/Naoray/hearth/releases/download/v0.3.0/hearth-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "c405904a3fd3676ce015045a4027c3d4125c31ef6e1749c28b93bf97d916de74"
    end
  end

  def install
    bin.install "hearth"
    bin.install "hearth-daemon"
  end

  test do
    assert_match "Unified Laravel development command center", shell_output("#{bin}/hearth --help")
  end
end
