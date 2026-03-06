class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.11.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.11.0/wt_1.11.0_darwin_arm64.tar.gz"
      sha256 "6f335102188ff6e927bc46b6866dded1ae663184a93be14900862e95b0e6a440"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.11.0/wt_1.11.0_darwin_amd64.tar.gz"
      sha256 "5e60470d442ec1d7701a6b31bb826a2a918ae8977be9978405b0ba1a4ac0a192"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.11.0/wt_1.11.0_linux_amd64.tar.gz"
      sha256 "643ac7bf10e54158a22154e972de55daaab7db80c044653d3b4ed9ea8a4a01cf"
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
