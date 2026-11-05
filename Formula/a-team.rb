class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.20/a-team-0.2.20-osx-arm64.tar.gz"
      sha256 "228f49bff8d4f1cdc4e04d6030b284ff616024c824ff52fb13f597a38a8e2220"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.20/a-team-0.2.20-linux-x64.tar.gz"
      sha256 "6b820b0a2e7a40e3a7f5e39c9c92a06a4b797b0b6e7d1aa3943e4876311725cf"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.20/a-team-0.2.20-linux-arm64.tar.gz"
      sha256 "401464e2f9cd96e58f7c5301584c71ce1224b6d041cebcb7aecd3bcbbe722d06"
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
