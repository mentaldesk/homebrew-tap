class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.8/a-team-0.3.8-osx-arm64.tar.gz"
      sha256 "5850a73910677d29246539669aeb161501b4bf66e4e75a4873350890636def3a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.8/a-team-0.3.8-linux-x64.tar.gz"
      sha256 "06a078a5dd7057b09f11dfc3e4d03e99f2d15137acdd73543bdaa05e34755ecf"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.8/a-team-0.3.8-linux-arm64.tar.gz"
      sha256 "45d04a1b0b4b8d06d54b0512f6c0395453e94cbb8e7cfc569b2e2945eeffba08"
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
