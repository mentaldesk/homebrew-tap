class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.21/a-team-0.2.21-osx-arm64.tar.gz"
      sha256 "49ca2b0c1bab7103064f4649d5b7d0794ff9fc10e616b290fbf428b3f60caf2e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.21/a-team-0.2.21-linux-x64.tar.gz"
      sha256 "391da0a88f1e0f422637dd764e05ca353b717162e2d4ec6b2a66388f01d1b6f3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.21/a-team-0.2.21-linux-arm64.tar.gz"
      sha256 "b5b36c66671b464a5424c008722152d4978022216731fe1ad956ef84d36807c2"
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
