class Wt < Formula
  desc "Config-driven Docker worktree management toolkit"
  homepage "https://github.com/elvisnm/wt"
  license "MIT"
  version "1.18.1"

  on_macos do
    on_arm do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.1/wt_1.18.1_darwin_arm64.tar.gz"
      sha256 "4238c6c29e9489c7b312bc7ac1372fde77b644cfffa6fda91b5885043ea2beef"
    end
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.1/wt_1.18.1_darwin_amd64.tar.gz"
      sha256 "3117b89ee376a135c03e7aab21cbd8052576dad8654cc59ecf0e1ef939d95383"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/elvisnm/wt/releases/download/v1.18.1/wt_1.18.1_linux_amd64.tar.gz"
      sha256 "de7bf23938df1fd615ef22d32ac6364da4e3a2ba7929e7602d7975d20d390eb4"
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
