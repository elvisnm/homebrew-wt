class Wt < Formula
  desc "Config-driven worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.1.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.1.0/wt_1.1.0_darwin_arm64.tar.gz"
      sha256 "b0f235f7e7afffa40dee8d110b521b059e3784f148e36c6ded34a5e1e1ff0c8c"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.1.0/wt_1.1.0_darwin_amd64.tar.gz"
      sha256 "79b780526b63da45e5cae0325753ddc11b2545c4d641285a5b0abab5d20089c9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.1.0/wt_1.1.0_linux_amd64.tar.gz"
      sha256 "4303372ba4a2e0fec05ca614140b163fd364fc162f159842dc35882005a2ad23"
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
        wt
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wt version")
  end
end
