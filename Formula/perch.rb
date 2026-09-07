class Perch < Formula
  desc "tmux-native home base for coding agents"
  homepage "https://github.com/idossha/perch"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "deb3a77af3781d8d4e4420a919160657f2d2dae78c391071101150df9aedae1b"
    else
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c3b1777b087349012adbcd2cf9d0b55c12cd3f63747115b135c08a8cbc7a5825"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0f1925d8c57bec013267769efe05ad9289e66d61a075ce273edb701cf2203fe1"
    else
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3eac07eac3915f9d58bef5dfb19d7bcb6675f389aa76103bfcb268fd8cc363e"
    end
  end

  def install
    bin.install "perch"
  end

  def caveats
    <<~EOS
      Homebrew cannot write to your home directory, so run this once to
      wire perch into your harnesses and tmux:

        perch setup

      Check it any time with: perch doctor
    EOS
  end

  test do
    assert_match "perch", shell_output("#{bin}/perch --version")
  end
end
