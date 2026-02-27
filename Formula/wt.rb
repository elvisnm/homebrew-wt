class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.1.0/wt_1.1.0_darwin_arm64.tar.gz"
      sha256 "a31376b8cc486dc6c60bee285fd616fe74254a1886c8664f2807daa04fe70992"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.1.0/wt_1.1.0_darwin_amd64.tar.gz"
      sha256 "e6d66cb3a69c2ce6b9254a425d5f8f84bcb94d4ef42b6c63b604784e5a08446c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.1.0/wt_1.1.0_linux_amd64.tar.gz"
      sha256 "d8bfc92fc3a429205a9df7fb8deba9cdd3840e0b09c4914b95f8f9b7a3332d6a"
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
