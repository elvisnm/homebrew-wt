class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.9.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.9.0/wt_1.9.0_darwin_arm64.tar.gz"
      sha256 "ea23fa966c9fa20e41c18dca100aab981df23ade038589d290f0bb16e38e2a6e"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.9.0/wt_1.9.0_darwin_amd64.tar.gz"
      sha256 "6655d4da107ef8514c843584072321b7106c3cc057f36ea5bfdc9c302a09233c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.9.0/wt_1.9.0_linux_amd64.tar.gz"
      sha256 "db694326832a9afbb80d466191b45aca973108b7ff89e890941f9a3869827092"
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
