class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.50/a-team-0.1.50-osx-arm64.tar.gz"
      sha256 "7d1bbb05a9e89dc69e5a3c6d925f59719ce6703c6b4c0c6a8eb4b91f88223767"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.50/a-team-0.1.50-linux-x64.tar.gz"
      sha256 "8657ab15cbe1d64799f07e66710c707ffd9f42714550029bfdd86f8ce8a10199"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.50/a-team-0.1.50-linux-arm64.tar.gz"
      sha256 "45df33390e7ed7d3463616e2e6c377971874c77d6f9837c09b8de290f87a409f"
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
