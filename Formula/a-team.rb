class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.4/a-team-0.3.4-osx-arm64.tar.gz"
      sha256 "2d38775264a3c87eab8932b61218387c64c1912299f54ce74615627e6775fbf7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.4/a-team-0.3.4-linux-x64.tar.gz"
      sha256 "5ce1ef2f0561d49ba47682bd3e13661649d4082332699af8155927ab24f79828"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.4/a-team-0.3.4-linux-arm64.tar.gz"
      sha256 "ed5bfc8c2e170f0ad11f7fe8f2502dc0ac4bcaeca19c3c9af2e90a52cfe68820"
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
