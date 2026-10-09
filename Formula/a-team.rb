class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.29/a-team-0.1.29-osx-arm64.tar.gz"
      sha256 "4496d36fb9b9e5e3ccf867ef16cfbc1960f9d9a1bff43fc7df2bec82da836ecf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.29/a-team-0.1.29-linux-x64.tar.gz"
      sha256 "3fd9b9d42e4f6e7b2031351a3201b9e83511091faf638a73c6689e1ea3803ff1"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.29/a-team-0.1.29-linux-arm64.tar.gz"
      sha256 "c92369eb6c0cbfbe64aa3cef8ace82532e57e8668af121445e7efa995d83c393"
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
