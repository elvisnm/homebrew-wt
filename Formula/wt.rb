class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.18.4"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.4/wt_1.18.4_darwin_arm64.tar.gz"
      sha256 "c4dfe8af1aaa8a0c23dbb77dd90317cd0db9ed3ea07e996d3e214f3c3619f63c"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.4/wt_1.18.4_darwin_amd64.tar.gz"
      sha256 "c1c30a6e7cfacd96362f4b32319ccd43b50f5f29f659943db71a328160600885"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.4/wt_1.18.4_linux_amd64.tar.gz"
      sha256 "326d5a4fc8aa901a2180adab4c2fa2b5fcc712407c0fe3e836573f5a95c917f1"
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
