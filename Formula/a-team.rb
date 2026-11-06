class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.25/a-team-0.2.25-osx-arm64.tar.gz"
      sha256 "31cc60c95ac2456cd33f14a0998dfa9efd27877a4ac0dd4ee41b13d3a95d6333"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.25/a-team-0.2.25-linux-x64.tar.gz"
      sha256 "d1123d6681aec20bab2f8ab116094d29eb5b7c600e25d4d0665a9e41c0140fee"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.25/a-team-0.2.25-linux-arm64.tar.gz"
      sha256 "7bab76a9586382e17be106022d979c5989a5149c94b67e32ab668eeebcca450b"
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
