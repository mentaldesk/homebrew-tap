class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.67/a-team-0.1.67-osx-arm64.tar.gz"
      sha256 "1e8f299036a78173c4ab0f1fa25e91e623ec26050d06d369e302e68e73f40ba2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.67/a-team-0.1.67-linux-x64.tar.gz"
      sha256 "a19e8e20deae3019f59f322b8b122c41b8f378a821b4130d61f7cee4863d1094"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.67/a-team-0.1.67-linux-arm64.tar.gz"
      sha256 "fd3207b9e54665a2125728bc18ea7b0e1d56e057e626990bdb7868cfa9db8d64"
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
