class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.0/wt_1.2.0_darwin_arm64.tar.gz"
      sha256 "f484f7501a77e5f36434224a90427bfd285a3b065b791ee3fe43f54a2042aa64"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.0/wt_1.2.0_darwin_amd64.tar.gz"
      sha256 "11c944ce860d4359a2451241820928f348c59cc184670382eddfc74df9085fd5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.0/wt_1.2.0_linux_amd64.tar.gz"
      sha256 "fca92421e271e4f9071ba126faa164569d181b346ddeb23ab3b4fe3e2a78798c"
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
