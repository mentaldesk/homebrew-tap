class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.100/a-team-0.1.100-osx-arm64.tar.gz"
      sha256 "7a1f92fa0bf267809f976f7743f015ff9af0ef56e7b614881288daf00d7f912b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.100/a-team-0.1.100-linux-x64.tar.gz"
      sha256 "6cad6f959ae1c9734c8fab14252ba20774de089d955395dd0509a2166843b1d2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.100/a-team-0.1.100-linux-arm64.tar.gz"
      sha256 "6c4c6b5a656754179314cde3fee2c3ec8361f1a3b02ff65f20dba8eead174c9e"
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
