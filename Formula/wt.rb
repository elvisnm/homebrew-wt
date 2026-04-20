class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.6.2"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.2/wt_1.6.2_darwin_arm64.tar.gz"
      sha256 "afa7c3fb9fb63c38ea8785ecc417ea94f532ef42e1d86a20dfef5a574b1c81b8"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.2/wt_1.6.2_darwin_amd64.tar.gz"
      sha256 "af20cc9fc10fdad22daa008602547f3819480bc35a6da7e690eb55adca8b1972"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.2/wt_1.6.2_linux_amd64.tar.gz"
      sha256 "43acee2928f4209645f138a9d59a02975cb0f46685a229706211fb5525d35715"
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
