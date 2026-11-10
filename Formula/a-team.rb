class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.60/a-team-0.2.60-osx-arm64.tar.gz"
      sha256 "0adfa7e95c1a427f09d2f1a8bf4703e50bc67e59e36765618b8d8f2cafb0dc54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.60/a-team-0.2.60-linux-x64.tar.gz"
      sha256 "649ef1cba630c31cc0b6335fe647992fe839834216552f01bbff672590ca5844"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.60/a-team-0.2.60-linux-arm64.tar.gz"
      sha256 "0826b9c7323d80af963d93c0f01199a960c14d58924961451599f34becd97a71"
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
