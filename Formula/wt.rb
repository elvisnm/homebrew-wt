class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.5.1"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.1/wt_1.5.1_darwin_arm64.tar.gz"
      sha256 "85356f5875e9d226080906bd95caed64ebd420d0ee42f0fe3a341a259abc2291"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.1/wt_1.5.1_darwin_amd64.tar.gz"
      sha256 "519fa1554bd755486927fc2575f69987664d82aae73cf493f133e30084c34260"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.1/wt_1.5.1_linux_amd64.tar.gz"
      sha256 "a5d14b2cb2cbf198f001a92d5210888cdf0036c477778496ae078ac8a18b04b9"
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
