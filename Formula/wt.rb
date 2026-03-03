class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.0/wt_1.5.0_darwin_arm64.tar.gz"
      sha256 "e53a3288ab585b70ef75e9684543089ccf40a4750c5d8ed85e1bfd8b61582eef"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.0/wt_1.5.0_darwin_amd64.tar.gz"
      sha256 "d44a6979bb94818411df68c7d79814469d072041c053975951eb3e685104da40"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.0/wt_1.5.0_linux_amd64.tar.gz"
      sha256 "2b4acf8cce45525cdcb3e4fd6eee2e583bcb93e97106955ad86f357a957ec66f"
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
