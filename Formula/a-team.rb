class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.23/a-team-0.2.23-osx-arm64.tar.gz"
      sha256 "8615cb58aea01610cbdc6559c48d382dca04242ade6a7208528cb8db75646e20"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.23/a-team-0.2.23-linux-x64.tar.gz"
      sha256 "c78d2730720c47423accb484553bb9dc5fc0d8156b8c5a07373358369f5fed0e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.23/a-team-0.2.23-linux-arm64.tar.gz"
      sha256 "b4bb5c354e7465ea332ca5068959f77c8f082a05d559e2a14afa6a41c83c7af6"
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
