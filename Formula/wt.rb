class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.0/wt_1.6.0_darwin_arm64.tar.gz"
      sha256 "6febcb740a0d7df6075e5c7163315bfc6a2efecd3e8b56137a69808975133d8b"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.0/wt_1.6.0_darwin_amd64.tar.gz"
      sha256 "9aee800049106c614d03ef05f1791a83c77873e8d04759201274398999dc87b2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.0/wt_1.6.0_linux_amd64.tar.gz"
      sha256 "344ebbe59cfaaaf9f836b1e3270dee4d5426a2089584815c619ef78d80e527c5"
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
