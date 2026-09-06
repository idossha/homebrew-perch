class Perch < Formula
  desc "tmux-native home base for coding agents"
  homepage "https://github.com/idossha/perch"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "921aa2f95eaa6afcbf25085e5b33b4e060f92956f2cd616f19cada7c19fa581e"
    else
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "cc99ee97b32ac43c6ba77ec775823ff784944e5c3329087720d9036a40fb83cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "960a09076fa2870657e79a63e1c224463797afdd1fd0b3a78104150a2a4fa266"
    else
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d41e3a4fc0d025461d6842e3fed4c85d4196736ca786a38e4e8ead7a26975219"
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

      Check it any time with .
    EOS
  end

  test do
    assert_match "perch", shell_output("#{bin}/perch --version")
  end
end
