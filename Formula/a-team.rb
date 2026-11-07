class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.46/a-team-0.2.46-osx-arm64.tar.gz"
      sha256 "a1bddafe84bdf0da5bec7c67a9ebd406f973660df559dd71ab1ce75ab9b3024d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.46/a-team-0.2.46-linux-x64.tar.gz"
      sha256 "085c4d6520f2ebd1787dc7d3bd64c642f10403f2b34734005160c1950dc117ae"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.46/a-team-0.2.46-linux-arm64.tar.gz"
      sha256 "e0fed498890d6dabba1c86196b518b49deb25eb4e12d50e72472c0dcdbe67647"
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
