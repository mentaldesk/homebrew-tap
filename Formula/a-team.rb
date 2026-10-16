class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.76/a-team-0.1.76-osx-arm64.tar.gz"
      sha256 "81981866e551bf077f571195c0e5d2345b05f78076069e936de8d196e9a5023f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.76/a-team-0.1.76-linux-x64.tar.gz"
      sha256 "414d5e2e5b9f7441c7ab1645ddf008166102cffc94695597aa92bcd2e5a701d6"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.76/a-team-0.1.76-linux-arm64.tar.gz"
      sha256 "63fb348d3f8f124b8922f5822aab6e4573a227d474d465de76b034d4d7356df2"
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
