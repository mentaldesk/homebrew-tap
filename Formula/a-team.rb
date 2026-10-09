class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.34/a-team-0.1.34-osx-arm64.tar.gz"
      sha256 "c99377e100a74933e6306dab1f864230c52ba7a21cc7d90c2bd103919395eee1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.34/a-team-0.1.34-linux-x64.tar.gz"
      sha256 "5715f3b30da687395328a2e24d295dddaf2f7cddf9151e29d40c4e3728982e73"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.34/a-team-0.1.34-linux-arm64.tar.gz"
      sha256 "78c0a537915d4113d35a88b64e5f6db04bb0186854a8c0114a92f48c6684404f"
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
