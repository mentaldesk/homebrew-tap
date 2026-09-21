class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.6/a-team-0.0.6-osx-arm64.tar.gz"
      sha256 "0e88e4c495ba6875438cde53dbc40202924130df6b34772d7ece8e653029a961"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.6/a-team-0.0.6-linux-x64.tar.gz"
      sha256 "ad1fc08c0773a209acdbc3c53511e773f8fead3a763e9615e90aa40b7e5e9991"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.6/a-team-0.0.6-linux-arm64.tar.gz"
      sha256 "c70a8420652a9c893e2d890d267d5a389186fc47d171cf4135b71cc29c14eb32"
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
