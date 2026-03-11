class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.15.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.15.0/wt_1.15.0_darwin_arm64.tar.gz"
      sha256 "6a6a5c8878d8d05308291d63132d0e3afb3a15581548bf0ac7aadb9ff8cf3c5b"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.15.0/wt_1.15.0_darwin_amd64.tar.gz"
      sha256 "2c78d9945f81c79eb88a17e8d0defdf21a2328fdff0698c59f71af714212f102"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.15.0/wt_1.15.0_linux_amd64.tar.gz"
      sha256 "5281c023e80d5cf8579f98228f926379b1f985f2a67ae9fa2e6f5200861d7ff1"
    end
  end

  depends_on "node"

  def install
    bin.install "bin/wt"
    pkgshare.install "share/wt/worktree-flow"
  end

  def caveats
    <<~EOS
      Scripts installed to: #{pkgshare}/worktree-flow
      The wt binary finds them automatically.

      To get started in a new project:
        cd your-project
        wt init
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt version")
  end
end
