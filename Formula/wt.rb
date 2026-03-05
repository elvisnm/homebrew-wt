class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.7.1"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.1/wt_1.7.1_darwin_arm64.tar.gz"
      sha256 "ef9c7d53e4c59685b8b1b3bdd3f10791144746f1d5e42f35aab27b492579840b"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.1/wt_1.7.1_darwin_amd64.tar.gz"
      sha256 "5e84672b9b077a824c846c43567c5fff50d5762350af1042a30aa24752cd4c56"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.1/wt_1.7.1_linux_amd64.tar.gz"
      sha256 "9265c8000ff821cc09961ec8d42c8c64e130941579b64a096cad45a95875d451"
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
