class Hearth < Formula
  desc "Unified Laravel development command center"
  homepage "https://github.com/Naoray/hearth"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/hearth/releases/download/v0.2.1/hearth-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "52fd146672720737bc26667c093268baac1c55519a78c9e74539eddff35f7dc4"
    else
      url "https://github.com/Naoray/hearth/releases/download/v0.2.1/hearth-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "23878c26b5d32e53ab2232be19c991d93b50f290639516e11d234e23f5c96fc1"
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
