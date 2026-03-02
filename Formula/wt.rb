class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.3.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.3.0/wt_1.3.0_darwin_arm64.tar.gz"
      sha256 "15f81dc9c10275d5df6831c85d2a29f1825e404bb39ca56aedb8505fbb537ea9"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.3.0/wt_1.3.0_darwin_amd64.tar.gz"
      sha256 "7f983db6320ed6c5b3b043bec6e5f73a6750dac33c5b319d7644a9de7628e612"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.3.0/wt_1.3.0_linux_amd64.tar.gz"
      sha256 "2816810caa00d47baf0796f2bba2930a1441784e8b5f72e843a8736d3bf4f79e"
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
