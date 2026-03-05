class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.8.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.8.0/wt_1.8.0_darwin_arm64.tar.gz"
      sha256 "23555f480326635fb43306f65a52158752e1a7884f5ac131d52438a6c4975cbc"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.8.0/wt_1.8.0_darwin_amd64.tar.gz"
      sha256 "5a321639f8d0a0610b12c130d6b9fde6d70d8d6deedf25a297f425fc976a76a2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.8.0/wt_1.8.0_linux_amd64.tar.gz"
      sha256 "1005f9dd250c6f341d2c174266812066873136bf26bbebade0510debc773a187"
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
