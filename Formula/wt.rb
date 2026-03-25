class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.20.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.20.0/wt_1.20.0_darwin_arm64.tar.gz"
      sha256 "99325e241b68ee5594c7013b3b9097a741d01c9b482d3f6173327e4f5bbfee03"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.20.0/wt_1.20.0_darwin_amd64.tar.gz"
      sha256 "43102c4c6614a04ff7a5162c38b7e5963cb5593aeeac04d8fcbbcd0257582cbf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.20.0/wt_1.20.0_linux_amd64.tar.gz"
      sha256 "d9c8a44432972fac6e22b8fd8c213feec0bdc46c44e9eeb15226e94bce28a6f2"
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
