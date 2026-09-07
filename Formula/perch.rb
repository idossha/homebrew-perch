class Perch < Formula
  desc "tmux-native home base for coding agents"
  homepage "https://github.com/idossha/perch"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b93c05db9c4a0afaa08464be4c5eaad65aaaa7e077db9e021c17c25c0e491324"
    else
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e16093b37bed2ff29de99b015593ac50b4da30af6792696ba011e678507ad990"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d586781647aa4607cd05095e20a03a85406eb48f84a57b53a7b2142095e7c511"
    else
      url "https://github.com/idossha/perch/releases/download/v#{version}/perch-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb05ec2068e3abab5d2b620baf2f2d4f34307abe6760aa337efba32958d3aa00"
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
