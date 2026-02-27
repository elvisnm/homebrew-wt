class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.0.0/wt_1.0.0_darwin_arm64.tar.gz"
      sha256 "6c0990904d946c5d275586fd6307cae6eb080aa0163e360d86bf63cf02322edd"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.0.0/wt_1.0.0_darwin_amd64.tar.gz"
      sha256 "33f5711412532f01bcd5031756b56b1d8d123d427bbda6744dcd7e5c3be15df6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.0.0/wt_1.0.0_linux_amd64.tar.gz"
      sha256 "acbb52f8a5a38de05955a4b76af82139cd8b2319db3274cf895db699997c97fd"
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
