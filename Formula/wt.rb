class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.0/wt_1.7.0_darwin_arm64.tar.gz"
      sha256 "2bbd74615c7352c108b9f665e011301962e1d98ef1c35583ac72a7bed4c62248"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.0/wt_1.7.0_darwin_amd64.tar.gz"
      sha256 "59e1d4264aba02a18840eee7cd849f52ef982cfb73d2c335bf95b643455f7d1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.0/wt_1.7.0_linux_amd64.tar.gz"
      sha256 "6b8a9d8cff38d644301083515c15b6aa5b269d51ce329dd677f11779ca898124"
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
