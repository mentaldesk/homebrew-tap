class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.30/a-team-0.2.30-osx-arm64.tar.gz"
      sha256 "1e12b7ecbb987e249649011b1bde20b9ddf083af61dfb0fb7e3f584ae0ddbfa4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.30/a-team-0.2.30-linux-x64.tar.gz"
      sha256 "c5fd8433f30728ef82eaeb0ab129ad8fc46bf800798aed7ff7f87758a5b62853"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.30/a-team-0.2.30-linux-arm64.tar.gz"
      sha256 "3da35bc25b3302c6619de1f4d0250247c903ae80b9fd1336fb5b9c9147f2a3b3"
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
