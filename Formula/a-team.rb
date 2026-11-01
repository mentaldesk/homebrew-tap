class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.13/a-team-0.2.13-osx-arm64.tar.gz"
      sha256 "0945af14cce67dd9be49531804abcfeba34e5276f076527126d7ae65ab3ebce7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.13/a-team-0.2.13-linux-x64.tar.gz"
      sha256 "d3d959cc4c184df7fc54d370e2205f986e531ddd32331dd2dfe3ff4cd1355414"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.13/a-team-0.2.13-linux-arm64.tar.gz"
      sha256 "ba9823ca8c21445278ddc0abd7cd7ac2f7160c782068e7936df0376b141f00ba"
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
