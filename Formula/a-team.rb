class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.30/a-team-0.1.30-osx-arm64.tar.gz"
      sha256 "15377a1a8d43b4fd37a662775f763d63641472511ef21668acaa285d0bc9d6f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.30/a-team-0.1.30-linux-x64.tar.gz"
      sha256 "395f5d1afd008a3c74dc935111a696979bf5c4866e63ac672a20756056d26270"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.30/a-team-0.1.30-linux-arm64.tar.gz"
      sha256 "2b983b8f1f19f40dd583e86065c673ddbb2d691036dd5b57e0e2bb120c94a2ca"
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
