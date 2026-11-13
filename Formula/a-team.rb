class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.6/a-team-0.3.6-osx-arm64.tar.gz"
      sha256 "7174e33617fd2eaa44b2bdf4abad86811f837ac72e45153b786cc1972a8347c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.6/a-team-0.3.6-linux-x64.tar.gz"
      sha256 "ddbac8b489d8428a72426ab26887e1e03cee102cfd51075a850d9152a5eb1d7a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.6/a-team-0.3.6-linux-arm64.tar.gz"
      sha256 "7393a25ed193d861824264c7e771cc2d908f70339eec51daf835fc2aa2d0f88b"
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
