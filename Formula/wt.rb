class Wt < Formula
  desc "Config-driven worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.0.0/wt_1.0.0_darwin_arm64.tar.gz"
      sha256 "d33fd9cac9276803132d92ed46c1fd866d2b4409d73d71c49d181bc368c01cc8"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.0.0/wt_1.0.0_darwin_amd64.tar.gz"
      sha256 "6d89fcc5895e8df044d645ff78d4e24d2e0acd0f41e42d9ad383b5db0e188e54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.0.0/wt_1.0.0_linux_amd64.tar.gz"
      sha256 "12a6375e318d03e74c66c57494d82d2d42643b4dcb77159e3d47d68571bcfdd1"
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
