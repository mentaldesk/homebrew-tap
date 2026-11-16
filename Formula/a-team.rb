class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.13/a-team-0.3.13-osx-arm64.tar.gz"
      sha256 "9059d90aa46df9ddd9f30193fb59528523baf501f582bbfda5bea3d90ae5e2aa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.13/a-team-0.3.13-linux-x64.tar.gz"
      sha256 "c2b316348d99418277d15bfa744eeec5b5fbdfcdc4ff470087d62e3488053e9f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.13/a-team-0.3.13-linux-arm64.tar.gz"
      sha256 "357ac5175e7c419f1e39584c8107dd9012310531b881112b6518f614252fd2fb"
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
