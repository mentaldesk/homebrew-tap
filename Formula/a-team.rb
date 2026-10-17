class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.82/a-team-0.1.82-osx-arm64.tar.gz"
      sha256 "26a1f9f18fdc623cb60271b7f40b81950c239a0fb36cef216fa0db723d9383fa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.82/a-team-0.1.82-linux-x64.tar.gz"
      sha256 "d45c71bf8c9e497b9f18c91704063b6b3383ea723211d8e49f593484c1f3d88f"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.82/a-team-0.1.82-linux-arm64.tar.gz"
      sha256 "3620ad818dbe94e583ed3d1a3f3d16464905511cb44edcf88565612a7fbfa17f"
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
