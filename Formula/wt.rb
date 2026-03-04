class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.7.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.0/wt_1.7.0_darwin_arm64.tar.gz"
      sha256 "c918a0255f7a6177ba1994bd0a0487db4f6c3db1cf9cd7fbc5dbe2ed85ea26c3"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.0/wt_1.7.0_darwin_amd64.tar.gz"
      sha256 "5cd43ce8631c18923c68097f517164b814db621c4c95ecba2bf760b9369c5e45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.7.0/wt_1.7.0_linux_amd64.tar.gz"
      sha256 "9b2d6bddec0195c2f3444b7173a1828579936cb940dd39222944e8ca491613f5"
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
