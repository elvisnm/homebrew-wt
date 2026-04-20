class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.6.1"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.1/wt_1.6.1_darwin_arm64.tar.gz"
      sha256 "f29ffca934c76c92444a27ce821291ca3c09320bd512f37ec1c05eaffdb70dbf"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.1/wt_1.6.1_darwin_amd64.tar.gz"
      sha256 "feec39f2ab328e269cbecd6a39db8d521980a36916706878bb1d01c77f45ed7d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.6.1/wt_1.6.1_linux_amd64.tar.gz"
      sha256 "71f505d0fb5aa962ae2fb3312f47c0ac5c9efb92cb5b0a20ae7fc973c27a8d1d"
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
