class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.51/a-team-0.2.51-osx-arm64.tar.gz"
      sha256 "9367e0ee8e0461529c490f0c8ea47b5b9dc765ebc7b6b2c89a1f566596a33a87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.51/a-team-0.2.51-linux-x64.tar.gz"
      sha256 "d2951b16248d0954eb40edf2c6ee9cfa540ec95601d855ef16e6edf24c69f1da"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.51/a-team-0.2.51-linux-arm64.tar.gz"
      sha256 "0b5750cc682e128202d06ea4f5bf8b09523ed827b158dfe054e8384e08561772"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/a-team"
  end

  def caveats
    <<~EOS
      The agents run in Claude Code, which needs to be installed and logged in:
        https://docs.anthropic.com/en/docs/claude-code

      Add a team by copying the example into your config folder:
        mkdir -p ~/.config/a-team/teams
        cp #{opt_libexec}/examples/team.json ~/.config/a-team/teams/<name>.json
      then run `a-team install` to start the dispatcher.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/a-team version")
  end
end
