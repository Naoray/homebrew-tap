class Hearth < Formula
  desc "Unified Laravel development command center"
  homepage "https://github.com/Naoray/hearth"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/hearth/releases/download/v0.2.3/hearth-v0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "c83b4ea5461c4cd14ec79ed4b6b647632b517f8bfa9127b77d5c2af0738ac964"
    else
      url "https://github.com/Naoray/hearth/releases/download/v0.2.3/hearth-v0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "dac3618ad23588a2b689ebba63bbf4531b99f469e2d7ceeb7982217681ce46e6"
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
