class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.59/a-team-0.1.59-osx-arm64.tar.gz"
      sha256 "2222fd328b0f5ac8b8aaa4e607a6c0e47aaf5114ef00712e9c3327cecbf0577f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.59/a-team-0.1.59-linux-x64.tar.gz"
      sha256 "2d4f4c870c95c6d67ae35efa053874949404a54a8364f70b9c023759a4de878f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.59/a-team-0.1.59-linux-arm64.tar.gz"
      sha256 "e11698cf532b1fab0e8765733f3821c7c94a2b140929cc4bfb28c02dd0554096"
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
