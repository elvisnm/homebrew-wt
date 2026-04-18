class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.3.0/wt_1.3.0_darwin_arm64.tar.gz"
      sha256 "cb3c54406f2a9fbc9479d355376e2b637b82f0c503bf925089b1668e939f783b"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.3.0/wt_1.3.0_darwin_amd64.tar.gz"
      sha256 "a53214772005dce09d47183266ff15f23cd0f45952e1d245aabcc323276886d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.3.0/wt_1.3.0_linux_amd64.tar.gz"
      sha256 "ae92de14389d47573b6aa7c382f5f103215174fd971ea16757704f47f301c0d7"
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
