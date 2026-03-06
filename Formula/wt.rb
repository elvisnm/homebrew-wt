class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.12.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.12.0/wt_1.12.0_darwin_arm64.tar.gz"
      sha256 "b730f9edc8b16b877efd30c35e65e97b43463fb02b0d852b9e23e5dbffdf1508"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.12.0/wt_1.12.0_darwin_amd64.tar.gz"
      sha256 "4dde2a950f778926a74ec4b2d858761f9cd894fc9053decfbb37f776835120d7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.12.0/wt_1.12.0_linux_amd64.tar.gz"
      sha256 "7e7a0222b947280a12f605c7b5099eb58a5183ebcf846aca7827ad99a2e58a8e"
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
