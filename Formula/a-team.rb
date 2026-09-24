class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.8/a-team-0.0.8-osx-arm64.tar.gz"
      sha256 "86f4aa7be1efab31c97ad0962bc90a6eaa0d8f5d0987adccfc89591904763afa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.8/a-team-0.0.8-linux-x64.tar.gz"
      sha256 "05473f971cda0e6b261b98c1345d0f9cd73e0dda73689f75729a8ea4fb52b567"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.8/a-team-0.0.8-linux-arm64.tar.gz"
      sha256 "6a95232d2265c4f570b3d5da59d47db3d1824bc5712e3879bf534927ae3765fb"
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
