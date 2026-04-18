class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.0/wt_1.5.0_darwin_arm64.tar.gz"
      sha256 "f3bf7f3ca597ecb438e0e13ce96e732ee94eb08a26d7f4445392197ce7135592"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.0/wt_1.5.0_darwin_amd64.tar.gz"
      sha256 "92ac03589fde3a5bdcc67116913962911ddd00b4b19bd1c772a9c7884858e55c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.5.0/wt_1.5.0_linux_amd64.tar.gz"
      sha256 "99960010bd38760d077a1e0c57b9bd5224ea1885f95c985555b2dbe01c2df1a4"
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
