class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.18.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.0/wt_1.18.0_darwin_arm64.tar.gz"
      sha256 "d7b7e021f61ff536d5ac2036de6ab1731891db3987cff9a4d0ecb1ff5ead984d"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.0/wt_1.18.0_darwin_amd64.tar.gz"
      sha256 "9ce7f744d14984b45881d170459eeaf787b8cc0b8770e3ca63d1c8dce93b2220"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.0/wt_1.18.0_linux_amd64.tar.gz"
      sha256 "1c215b59141fb18d4f83ead0917a3dfca440a97c25575bba3680788cccc7aa63"
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
