class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.15/a-team-0.2.15-osx-arm64.tar.gz"
      sha256 "af09e61b747c0509e5f617fe32451ea04da2c8cf1637937500cad8ea7abf14de"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.15/a-team-0.2.15-linux-x64.tar.gz"
      sha256 "08a1843b4c628bcc7abee7a76db91981c18b250379e681886d5c6e1afab8d5bf"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.15/a-team-0.2.15-linux-arm64.tar.gz"
      sha256 "e086893efc14c45bbb4e5717772f576b81acae83734686f52a444c9f5c3bcb31"
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
