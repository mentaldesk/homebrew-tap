class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.79/a-team-0.1.79-osx-arm64.tar.gz"
      sha256 "b962f7597461b691bf653254d030183aaf101f6865f070ef61c7b6ce59adaaaf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.79/a-team-0.1.79-linux-x64.tar.gz"
      sha256 "c3a601f9a83abfe7874667305eccaba5735394e2cfccc4c7833a913276ee7662"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.79/a-team-0.1.79-linux-arm64.tar.gz"
      sha256 "e240074a14a030a7dd8a16a5ca525c89810092549e1ed91021e2908b655b0ad7"
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
