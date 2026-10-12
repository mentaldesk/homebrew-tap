class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.57/a-team-0.1.57-osx-arm64.tar.gz"
      sha256 "3839702c4cf60c568b7175cd4e3146efc14dd0262ef8807772870cbd264a083a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.57/a-team-0.1.57-linux-x64.tar.gz"
      sha256 "de744eb6cfbad227b6825bc043d9a3e27c433db181e7221ccc2273945ba422de"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.57/a-team-0.1.57-linux-arm64.tar.gz"
      sha256 "82434f53a38eed2817100e93e1c1c4197083fd5c5ccc83a2552e4d31ab90908a"
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
