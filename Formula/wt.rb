class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.2.1"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.1/wt_1.2.1_darwin_arm64.tar.gz"
      sha256 "8bf0c6682c84dfd509fd4bcb91ae923a69b2b78d3da656952a6da6ce6e9132d9"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.1/wt_1.2.1_darwin_amd64.tar.gz"
      sha256 "10dd0e04bedfa9e1e4c2e856e841c41fc421a28352db5ded58cc91df08da5813"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.1/wt_1.2.1_linux_amd64.tar.gz"
      sha256 "914651a703b0987cd57dd25fa2a8acd1306208f5738c9c75af47090492ce9ac7"
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
