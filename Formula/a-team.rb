class ATeam < Formula
  desc "Lead and Dev team of Claude agents that works a repo through its GitHub Project"
  homepage "https://github.com/mentaldesk/a-team"
  license "MIT"

  depends_on "gh"
  depends_on "jq"
  uses_from_macos "sqlite"

  on_macos do
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.92/a-team-0.1.92-osx-arm64.tar.gz"
      sha256 "a2544ee5091bf517dca49fafa8a11e35a3f57d78007f41861466115eb898ef5e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.92/a-team-0.1.92-linux-x64.tar.gz"
      sha256 "d9eb65f88424cf80fa214a0f522c556a2a5ca1496c33fc4d02f7aac69c7e2311"
    end
    on_arm do
      url "https://github.com/mentaldesk/a-team/releases/download/v0.1.92/a-team-0.1.92-linux-arm64.tar.gz"
      sha256 "5df205d350b06b74c9e1e75eedf140968ebafd183821aa98485baff7ddcce38b"
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
