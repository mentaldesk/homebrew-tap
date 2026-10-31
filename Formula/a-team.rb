class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.9/a-team-0.2.9-osx-arm64.tar.gz"
      sha256 "9c42cdb12f254f8f9c72e26985fbe73f73957827cf43164624b6bfa8776a6892"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.9/a-team-0.2.9-linux-x64.tar.gz"
      sha256 "30251bf9a6198f9edbb6f3ff552c78c5b23772dad6291e9a2859e8aa5e6190bc"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.9/a-team-0.2.9-linux-arm64.tar.gz"
      sha256 "cc0f13a9c9975708ed7ece64f2206fe1590e8efde9b299ccc32cf014d4e207a2"
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
