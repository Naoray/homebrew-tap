class Hearth < Formula
  desc "Unified Laravel development command center"
  homepage "https://github.com/Naoray/hearth"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Naoray/hearth/releases/download/v0.3.1/hearth-v0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "9d3c6eda24183ca84698cedc6fc7171cb4e8c43a88250282206847b236db7733"
    else
      url "https://github.com/Naoray/hearth/releases/download/v0.3.1/hearth-v0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "7890d284aeb983550de711d10b5becbae68d3893ef79bd76c3c3e52da965c3b7"
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
