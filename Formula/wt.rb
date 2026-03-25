class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.19.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.19.0/wt_1.19.0_darwin_arm64.tar.gz"
      sha256 "8e66d83070f479a37a846e638fa5b4cf3e1591e9f2d7ae726881c154fc2e9f12"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.19.0/wt_1.19.0_darwin_amd64.tar.gz"
      sha256 "91fc423271e945a8b820d7d7ea34b406cbef49abc76487bc6946c3ea54058de2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.19.0/wt_1.19.0_linux_amd64.tar.gz"
      sha256 "eda75b68c6217b37b1a8f823d264c74ca22b7d56b578c593728e2d5c0a1d1e1a"
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
