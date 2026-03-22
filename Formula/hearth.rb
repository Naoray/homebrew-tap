class Hearth < Formula
  desc "Unified Laravel development command center"
  homepage "https://github.com/Naoray/hearth"
  license "MIT"

  # Pre-built binaries (populated after first tagged release)
  # on_macos do
  #   if Hardware::CPU.arm?
  #     url "https://github.com/Naoray/hearth/releases/download/v#{version}/hearth-v#{version}-aarch64-apple-darwin.tar.gz"
  #   else
  #     url "https://github.com/Naoray/hearth/releases/download/v#{version}/hearth-v#{version}-x86_64-apple-darwin.tar.gz"
  #   end
  # end

  head "https://github.com/Naoray/hearth.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/hearth-cli"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "crates/hearth-daemon"
  end

  test do
    assert_match "Unified Laravel development command center", shell_output("#{bin}/hearth --help")
  end
end
