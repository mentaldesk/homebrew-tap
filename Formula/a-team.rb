class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.11/a-team-0.2.11-osx-arm64.tar.gz"
      sha256 "ab255f97f9fa1add25c7ae78fc95c598c1710b6f85dba529a61f47e2c387b489"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.11/a-team-0.2.11-linux-x64.tar.gz"
      sha256 "5dd38191996e1a3aa657db2679f3169e511c4639033cadd606d96f1115028702"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.11/a-team-0.2.11-linux-arm64.tar.gz"
      sha256 "0a9665c667fe985ee756b8da3adf4332a1139f5957706f14b7b9d809a7ee1f13"
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
