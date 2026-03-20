class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.18.3"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.3/wt_1.18.3_darwin_arm64.tar.gz"
      sha256 "a078edcdf7446d0045509f41c3c64edc6361d3c9e0806fe4d13619b5f76712da"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.3/wt_1.18.3_darwin_amd64.tar.gz"
      sha256 "c8e12a5783a7d863ee97c06239d9601db7d1ce2eca5dc08b96109bd0cbd80dee"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.3/wt_1.18.3_linux_amd64.tar.gz"
      sha256 "979cea86ebb06315f55b99cf493efd7157f724406519da420ae991da8d58f622"
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
