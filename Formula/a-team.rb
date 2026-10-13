class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.61/a-team-0.1.61-osx-arm64.tar.gz"
      sha256 "2b320669c18204044814dd1b2121676dc3649427a95caccc89ff563cdcebd595"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.61/a-team-0.1.61-linux-x64.tar.gz"
      sha256 "5b941496d627eafc50ef0a4adb086e0a9978de1b66362b2943a3c7c51d1a7c27"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.61/a-team-0.1.61-linux-arm64.tar.gz"
      sha256 "87e13e6deed420a9c600f66270dd81162c3717e90ec4616f100d02c61e9adb3d"
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
