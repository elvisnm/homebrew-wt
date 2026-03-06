class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.13.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.13.0/wt_1.13.0_darwin_arm64.tar.gz"
      sha256 "701e23b3ecb6bb4789c112f92409ef394e750db72e9d01cf3927a489cb00fa5f"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.13.0/wt_1.13.0_darwin_amd64.tar.gz"
      sha256 "0b9b3aa9b0bf3db7a29b176351580da7f072bb32a79a33dfc1193759a5f9a2fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.13.0/wt_1.13.0_linux_amd64.tar.gz"
      sha256 "eb7d00aff69606aa92f137733ea92b6a672dc9f42191f04dccb26c38245bd923"
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
