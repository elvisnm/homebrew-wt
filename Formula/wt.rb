class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.16.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.16.0/wt_1.16.0_darwin_arm64.tar.gz"
      sha256 "a64df127e136fec2412987450dded43e879d9d61189dde60c36eaee0a4cf6e3e"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.16.0/wt_1.16.0_darwin_amd64.tar.gz"
      sha256 "1ddbd32db3c2c94e0dea136fff80643b4f139fdf3cf6e3657fdd114062fff70a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.16.0/wt_1.16.0_linux_amd64.tar.gz"
      sha256 "96a96e48b3e91ba061faafe9391db04baef1f788d5345ffdf4bf2862c58aa5fe"
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
