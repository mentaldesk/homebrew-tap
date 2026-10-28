class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.2/a-team-0.2.2-osx-arm64.tar.gz"
      sha256 "38f1ffd2f1c096f2a05e03db0d3d35d2fe7f430bd291cdb1926d79c52c5b7e97"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.2/a-team-0.2.2-linux-x64.tar.gz"
      sha256 "f95d433293a4e81d20a8507028726c977960fb59fd751b4623d30e96136b872e"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.2/a-team-0.2.2-linux-arm64.tar.gz"
      sha256 "1c0e9abdc7e08845e78d4d71d21c2d17988c511beb3686fd716565273cec8cc9"
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
