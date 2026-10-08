class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.24/a-team-0.1.24-osx-arm64.tar.gz"
      sha256 "29e8bcb16507c1a1a203f0f62ff1275062ec88df8a83ec0e8a9f342225638cf0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.24/a-team-0.1.24-linux-x64.tar.gz"
      sha256 "caedeb1be81c0d7153567b9d4c8b64e949144bd0266149f4eee3b74f8cdf647a"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.24/a-team-0.1.24-linux-arm64.tar.gz"
      sha256 "7d8c069b158a65fb2a5d2b3630fa7412fc3339b00c93d1b687b6f5f3fcf4f94b"
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
