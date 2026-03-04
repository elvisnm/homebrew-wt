class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.6.1"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.1/wt_1.6.1_darwin_arm64.tar.gz"
      sha256 "cd988703544e4d37cbb3986448a0105a868a54395ee9ee62da0873a4aeccbf3d"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.1/wt_1.6.1_darwin_amd64.tar.gz"
      sha256 "06fefab294dbdb5980da31d4cda11b9158f58d70777858bb119f1e2f55c70814"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.1/wt_1.6.1_linux_amd64.tar.gz"
      sha256 "325b9d931617f3a0b41d28d2b43d75badf777e50cb9ef0b27cc5a14a0cc2950b"
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
