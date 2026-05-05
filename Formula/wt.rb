class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.8.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.8.0/wt_1.8.0_darwin_arm64.tar.gz"
      sha256 "71891d1001541f067366ebdd41d1c7b3d3e7cb3dae7577b6e1f94b3c1c98d1f1"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.8.0/wt_1.8.0_darwin_amd64.tar.gz"
      sha256 "03a2bf20a9321c99bc76c784606528178a7e371ffc662ddc2de46d2491c93c6f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.8.0/wt_1.8.0_linux_amd64.tar.gz"
      sha256 "b017e9f92efb2d5cf482bb1e8836f3ad3e730e0c162cbcc1823e518b514fe773"
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
