class Wt < Formula
  desc "Config-driven worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "4.0.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v4.0.0/wt_4.0.0_darwin_arm64.tar.gz"
      sha256 "beb1ac78d1ed715778e58db7f65ed552bb3fb420023324077a7575023861e36f"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v4.0.0/wt_4.0.0_darwin_amd64.tar.gz"
      sha256 "83a27a4fc29b538b665af5967d5daf70e6da54c590e768a62b6361d113aca4f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v4.0.0/wt_4.0.0_linux_amd64.tar.gz"
      sha256 "669ea135fe416f37c6f384ab2612a57479929ad327265447ac2dc8c2051a6c02"
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
