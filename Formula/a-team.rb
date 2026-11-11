class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.62/a-team-0.2.62-osx-arm64.tar.gz"
      sha256 "0576268ab1de1a238b0f16a55203b7032f51ed5d458efe4d218dbddd8d3f310b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.62/a-team-0.2.62-linux-x64.tar.gz"
      sha256 "068dad31f9bf3d292b163a2bc639f04fa729ec34420eb98a5fff57182043a038"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.62/a-team-0.2.62-linux-arm64.tar.gz"
      sha256 "e70eacfb140bb80e9153ad9c8f94dbc99eb69d51e5df8ff1f734237741b8901a"
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
