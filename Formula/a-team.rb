class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.7/a-team-0.3.7-osx-arm64.tar.gz"
      sha256 "50a92340e10bedbacb846357db2994f5fdf5926967e03fdc32ee2822f9bfef53"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.7/a-team-0.3.7-linux-x64.tar.gz"
      sha256 "1e830c27b3300f08cd75cbced5ff6e4fef32620bea913d27f376c55a0a3d08d2"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.7/a-team-0.3.7-linux-arm64.tar.gz"
      sha256 "b81f887f5d23bab5fca2989201fc169d167b966fa8ef83ba23b44fbd5954fa4d"
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
