class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.28/a-team-0.3.28-osx-arm64.tar.gz"
      sha256 "5966bdfab38b5921e44b686da61521a6d3ee7d59ebf0aa6625c6a3b95c356f42"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.28/a-team-0.3.28-linux-x64.tar.gz"
      sha256 "cda7944313a6fa94fb3f846a82498350bb397dd88f65d609c741b35fda290808"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.28/a-team-0.3.28-linux-arm64.tar.gz"
      sha256 "3419ed52c4f978d94b536affbae37100b2992866d07e28673a6a1f76cccec374"
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
