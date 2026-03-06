class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.10.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.10.0/wt_1.10.0_darwin_arm64.tar.gz"
      sha256 "768d69838dd464145cf4a4b64d564c3f45226c0b290038f173ebc788fbf19a65"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.10.0/wt_1.10.0_darwin_amd64.tar.gz"
      sha256 "d026f6a4949711e5d260b3a7ca605b842da98fa884f7ce953c3e9dc66d9c2de3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.10.0/wt_1.10.0_linux_amd64.tar.gz"
      sha256 "e7e915795c446a01be1dc2a3897d1ca8a79808599a0f4ca875777fd41a6646e5"
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
