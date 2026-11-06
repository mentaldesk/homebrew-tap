class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.32/a-team-0.2.32-osx-arm64.tar.gz"
      sha256 "e9df307b1e251f8989e23e8bd06e8e80ed721261562d6d9c4f6f7addf8cf9910"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.32/a-team-0.2.32-linux-x64.tar.gz"
      sha256 "3e1f3e10069c46c0cea2b0a78cdbc2add70df4dfc259c119b026e4a2f8de9569"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.32/a-team-0.2.32-linux-arm64.tar.gz"
      sha256 "390eeae3006861f696ceccaa213689b58d7e330912380e1d1e99d12ca8f802a3"
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
