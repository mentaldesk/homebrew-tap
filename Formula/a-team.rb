class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.24/a-team-0.2.24-osx-arm64.tar.gz"
      sha256 "ae04e4139726004191dea2da3440738739011eca1318b3e05692f93db24163d6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.24/a-team-0.2.24-linux-x64.tar.gz"
      sha256 "6de75c9f24a59ed8a74f91b03104684f4d41da8a4c80a85db358bf2e04428d12"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.24/a-team-0.2.24-linux-arm64.tar.gz"
      sha256 "7e9729d3ca59a99d6645e4dc943102496fa07757584da8a82a43845c13d149e5"
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
