class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.21.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.21.0/wt_1.21.0_darwin_arm64.tar.gz"
      sha256 "68d3d2a41f68acf86aca753266b31da69acc17aaf5a46e653e76db1dc03946c3"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.21.0/wt_1.21.0_darwin_amd64.tar.gz"
      sha256 "40be8a996434c13ecc5026af3877f628450f37f1aac626cecf92fe8035a5cdbe"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.21.0/wt_1.21.0_linux_amd64.tar.gz"
      sha256 "fa60982c29c437791d88f6639bf7c0cb0b6895119fd0448cc610706bbd2d2df3"
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
