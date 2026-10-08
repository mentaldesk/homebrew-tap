class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.25/a-team-0.1.25-osx-arm64.tar.gz"
      sha256 "3bb3b10b2a7427a76edf568f560a50424054647c3fca669aa89255c194087682"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.25/a-team-0.1.25-linux-x64.tar.gz"
      sha256 "917a8df9c6daa613c52025ccb0e57c05db1150edba5e5d4a43b4d80ed7acf5e4"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.25/a-team-0.1.25-linux-arm64.tar.gz"
      sha256 "c057915f46d7a6e5ff84f813a36d58a2b24b72963babc363fbfaaca1930983a6"
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
