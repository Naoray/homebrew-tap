class Hearth < Formula
  desc "Unified Laravel development command center"
  homepage "https://github.com/Naoray/hearth"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/hearth/releases/download/v0.2.0/hearth-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "77c5fec4570b0a0b8bf8821c99b1c031fec458e437c75551425c6d6158bd683a"
    else
      url "https://github.com/Naoray/hearth/releases/download/v0.2.0/hearth-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a1b5e20d16af735c4626470f657b9a33cba7b7c73e36feff30e820b1bd49f419"
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
