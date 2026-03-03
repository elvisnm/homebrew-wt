class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.6.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.0/wt_1.6.0_darwin_arm64.tar.gz"
      sha256 "3fcb6bc3f72c6e3adde1abffbe49b5174e42bd12a4f0b34296827e2636ece25b"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.0/wt_1.6.0_darwin_amd64.tar.gz"
      sha256 "dec68b49fae5a5c3a41cd0d45064b88cf16208794ec589df0c875ac332b1be23"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.0/wt_1.6.0_linux_amd64.tar.gz"
      sha256 "49a1648dd734b3718eeaaad9f84dc8ee454eb4d3a84853c2d15ddbec20e086c6"
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
