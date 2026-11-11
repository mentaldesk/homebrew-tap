class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.63/a-team-0.2.63-osx-arm64.tar.gz"
      sha256 "f14dfd8f2c4382ac8b7af8f1126aee6ee50be5424be02c340ac5310b102b35f7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.63/a-team-0.2.63-linux-x64.tar.gz"
      sha256 "6c5570c257f897b81114a86503d8982c821e17ffe9d194504d6a64070ec3140e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.63/a-team-0.2.63-linux-arm64.tar.gz"
      sha256 "d67e29a3e74d2206cf039d0252e388bf1468945ad3a020c708f0942e74a24d4e"
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
