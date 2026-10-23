class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.96/a-team-0.1.96-osx-arm64.tar.gz"
      sha256 "cd91169c16f329c0b0c1d60001fb017d1fcc8773312db122b125112c60e7d112"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.96/a-team-0.1.96-linux-x64.tar.gz"
      sha256 "094fdf586f661b82c95b1f22ea32518986ea28e78ea94c470c812c628033cf16"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.96/a-team-0.1.96-linux-arm64.tar.gz"
      sha256 "89f7bc830f156ae9524d21c4b2f6d122953fa3e5506421c604440556d56d5c5b"
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
