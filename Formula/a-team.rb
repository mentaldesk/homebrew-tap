class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.17/a-team-0.3.17-osx-arm64.tar.gz"
      sha256 "3196a045a39f6a8ca5b66fd12ae10c91968893f7056b99a0b899845275293dc3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.17/a-team-0.3.17-linux-x64.tar.gz"
      sha256 "9b55208af83dc7eb084a82fd299b6590dc66ba4aa193c753fdf9c41a5ff55a5b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.3.17/a-team-0.3.17-linux-arm64.tar.gz"
      sha256 "bc34b551cf222c80f5e0e703ea28406ed153a3a17a93311feee8a5463bf48e3e"
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
