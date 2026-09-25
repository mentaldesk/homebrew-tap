class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.9/a-team-0.0.9-osx-arm64.tar.gz"
      sha256 "2f46552ad425a90f7b406b4fdc33bfe6b081773d70c2f127f0b342937775d002"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.9/a-team-0.0.9-linux-x64.tar.gz"
      sha256 "77db078956953c62a34c339665f687e91ddcbaf039765524132154f6681ff885"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.0.9/a-team-0.0.9-linux-arm64.tar.gz"
      sha256 "0b34c932fdac65d5be717d082b454586bc1adedbcae41c02d279bcbf8be30fd9"
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
