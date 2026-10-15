class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.71/a-team-0.1.71-osx-arm64.tar.gz"
      sha256 "e5024a9a4d86e83fc409f5a1b090bf508b947e01f50babc54bb13b3ba8ecdc0c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.71/a-team-0.1.71-linux-x64.tar.gz"
      sha256 "f69e9f40508c9a8830547f896597284fb4a9414feb0ff12581430c6dc409f33b"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.71/a-team-0.1.71-linux-arm64.tar.gz"
      sha256 "e99e1d9072c8bdf0aa3963c0302cae54c11131f8cb4105164304bb98c9b7ef59"
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
