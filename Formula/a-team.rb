class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.20/a-team-0.3.20-osx-arm64.tar.gz"
      sha256 "6e4e4435d76997c9c2b30e825fee0ed5534b5e1003f9e2572d45a3bdb2c07cf7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.20/a-team-0.3.20-linux-x64.tar.gz"
      sha256 "d9c31c6f10b142c2778d6b0c21401413fc1f86cd23f13cd1deb0d595f43629e8"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.20/a-team-0.3.20-linux-arm64.tar.gz"
      sha256 "5c150b5f3682696d8b0fbabc29fdaa0d39092bff2a149d7d057ee232554123f0"
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
