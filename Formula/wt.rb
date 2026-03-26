class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "2.0.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v2.0.0/wt_2.0.0_darwin_arm64.tar.gz"
      sha256 "eaae726bc752faa68e66b56dbce2da76acf5e43f97d5756502d44e3e4cc155bc"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v2.0.0/wt_2.0.0_darwin_amd64.tar.gz"
      sha256 "729af5613391e0b63da640b5e7a8a3d47bba5bcf8f64bda918263e70f70ee334"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v2.0.0/wt_2.0.0_linux_amd64.tar.gz"
      sha256 "ff448b61714b4f2ad4407c310d5944b04bba85578dcafaa4bd4ad1d76923000a"
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
