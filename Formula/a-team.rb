class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.21/a-team-0.1.21-osx-arm64.tar.gz"
      sha256 "4a9ec03b249a1bdc850cfeea42f44d610d1d178b07daad1940f2f84556d7589c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.21/a-team-0.1.21-linux-x64.tar.gz"
      sha256 "1f5eec055e527fb2456496345fa6414cc41f60fdc8728a4c173ab12d2a328423"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.21/a-team-0.1.21-linux-arm64.tar.gz"
      sha256 "59ed83ef5176f3829da51256c8e4c9a1f955a8da4686c8a082482d183897063a"
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
