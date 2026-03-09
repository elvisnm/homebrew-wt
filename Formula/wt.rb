class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.14.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.14.0/wt_1.14.0_darwin_arm64.tar.gz"
      sha256 "72b5a96aa74e2d31c0e14e8527224d7934a304c71cbb986d0a22f7281a8c8077"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.14.0/wt_1.14.0_darwin_amd64.tar.gz"
      sha256 "478a9b411e21e3b43b35d673d7ca102de5c802950579fa7db79a44c2864d1304"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.14.0/wt_1.14.0_linux_amd64.tar.gz"
      sha256 "ffdaf752e648d4fa3954f0e7fdd37c7bb0bddeb28835a67ecabae4222c5561ec"
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
