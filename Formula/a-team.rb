class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.43/a-team-0.2.43-osx-arm64.tar.gz"
      sha256 "33381fd7c7187e8a141de66284a6585f152cc1c6c25c30b7650e986cc0a6a5b6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.43/a-team-0.2.43-linux-x64.tar.gz"
      sha256 "711d1d3e8240d0986ef42284a8bd1e1b46e7d80ceed11ca71c64efdf5cb8cfc3"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.43/a-team-0.2.43-linux-arm64.tar.gz"
      sha256 "ef92c8c30969f7e256a120cd276029636ff8d58a674b195b23b79a3dedd03819"
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
