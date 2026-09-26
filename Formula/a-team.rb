class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.11/a-team-0.0.11-osx-arm64.tar.gz"
      sha256 "bf5d37b0dc215c1fcfb7094d013860c7b302cc487c24423b9530d478fcbb08f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.11/a-team-0.0.11-linux-x64.tar.gz"
      sha256 "2f31d828ee2735efaff1b0565c26e57c420b83d03edef1e5e8cd82ef3cf04b3e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.11/a-team-0.0.11-linux-arm64.tar.gz"
      sha256 "7f8f3c2567543d9cec6629557dddef36717d0216e1817858b671df561fd20b88"
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
