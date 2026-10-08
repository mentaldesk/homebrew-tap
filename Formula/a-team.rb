class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.17/a-team-0.1.17-osx-arm64.tar.gz"
      sha256 "9d2d101616ab14db7d9460db249189d9a34f131fe5bb7259b73ac5d1b1f416ce"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.17/a-team-0.1.17-linux-x64.tar.gz"
      sha256 "6dc746e003501464f4664303cdbd92563d9e68aaed1a0116fbf3e70d7174385d"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.17/a-team-0.1.17-linux-arm64.tar.gz"
      sha256 "bdb72d41991035dbc23bab53ffc3c80238885c200077e6692e11220631908763"
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
