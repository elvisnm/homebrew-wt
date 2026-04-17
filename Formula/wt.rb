class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.2.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.0/wt_1.2.0_darwin_arm64.tar.gz"
      sha256 "8bc18c474fcbfbbdb29384b268cbe278496b2bf27fb6980e3db8dc73d9c6f9bb"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.0/wt_1.2.0_darwin_amd64.tar.gz"
      sha256 "0662472282074dde39e46fd6fed902628352d86b45ad022384131b06a78c2444"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.2.0/wt_1.2.0_linux_amd64.tar.gz"
      sha256 "40f409c030c4002647bf04950f47499935b98ef2bc6dc571ecaa2bdf6aa17f83"
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
