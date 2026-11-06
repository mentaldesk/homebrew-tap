class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.28/a-team-0.2.28-osx-arm64.tar.gz"
      sha256 "8cf3a06eb8fe5a17b19dd48fb17e2153350ef2e58c6d8d9e923d411870624fe6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.28/a-team-0.2.28-linux-x64.tar.gz"
      sha256 "8a75777ca783af41efe2a0acb2469579d05f17ba6b25172a685040046356c079"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.2.28/a-team-0.2.28-linux-arm64.tar.gz"
      sha256 "efaaae8c51fe5d80f8fe810f0003b653fda42a77528fdc030e1bcd4f00e1aec8"
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
