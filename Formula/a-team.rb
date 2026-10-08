class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.20/a-team-0.1.20-osx-arm64.tar.gz"
      sha256 "982124fcbc6b67953b70c902c885fca4cf1c1eacd51c902a05b457f937bca379"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.20/a-team-0.1.20-linux-x64.tar.gz"
      sha256 "3d5082be3e6ce29014c0764a2b88adfb3293940be49f1ff5b1d1ce1c6ca98314"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.20/a-team-0.1.20-linux-arm64.tar.gz"
      sha256 "9566614c7d91540228304348eca883d9e4e9bd817927fb4563d071f1d6d5795f"
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
