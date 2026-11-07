class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.55/a-team-0.2.55-osx-arm64.tar.gz"
      sha256 "1597e69ebd15236c902ff57697c2c55ddb13a54e1da7f2a314dc19dd277b5552"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.55/a-team-0.2.55-linux-x64.tar.gz"
      sha256 "824f72553c9d1218fba81f684cfcb31d2c7e0ccad14b6bbbe73bae8814b11b1c"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.55/a-team-0.2.55-linux-arm64.tar.gz"
      sha256 "9d9ba9876c89978c3db41c228299e025db03138249000cc39ba794d7cbcfa8d5"
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
