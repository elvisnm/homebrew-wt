class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.4.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.4.0/wt_1.4.0_darwin_arm64.tar.gz"
      sha256 "530f6c6feb5a96dfc50eb16bbea8c85fca2caa4d02f6f4aa76b57e1cd5e47529"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.4.0/wt_1.4.0_darwin_amd64.tar.gz"
      sha256 "e77784b8144b41d6f6ef70a7f95657ea3200167af9ada9990e354875cd201d15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.4.0/wt_1.4.0_linux_amd64.tar.gz"
      sha256 "38d23a1ceca32153e1eb120c60848cc501f24f31b959391cd6fa1c96a5c6bdac"
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
