class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.17.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.17.0/wt_1.17.0_darwin_arm64.tar.gz"
      sha256 "2f1b649d3864e4c92761fc48a03c07121a0307ee01e1b127413cb1288407817d"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.17.0/wt_1.17.0_darwin_amd64.tar.gz"
      sha256 "fcc6dd44f75b96239fab01281336be514ee1597c7cd376d41c53cc02bc23e9ba"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.17.0/wt_1.17.0_linux_amd64.tar.gz"
      sha256 "3ee44e5553980e0d4c4cf11bf4c726d20d30e0a51f16183eee6a9cefee3ca880"
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
