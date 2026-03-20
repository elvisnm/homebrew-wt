class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.18.2"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.2/wt_1.18.2_darwin_arm64.tar.gz"
      sha256 "1768205b2c17826ccd52a4463a7d31e0f221c02487908d231e0b05d415d45bee"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.2/wt_1.18.2_darwin_amd64.tar.gz"
      sha256 "32f4357f615b0149a073f5e2b5faf9c078aa28079321a29c7320ef03a6aee1e5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.2/wt_1.18.2_linux_amd64.tar.gz"
      sha256 "27712bc55e2bd639897ddcac30b7bcfe2322c39be2cb7da3cfeb447f699ae55c"
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
